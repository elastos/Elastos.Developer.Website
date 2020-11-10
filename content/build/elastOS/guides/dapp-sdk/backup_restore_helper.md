+++
title = "Backup Restore helper"
weight = 40
chapter = false
pre = ""
alwaysopen = false
+++

## Purpose

The backup restore helper is a service on top of hive, that helps capsules **saving and restoring contextual application data** when elastOS, or capsules themselves are reinstalled.

This helper can:

* **Save local capsule data** to the user's hive vault.
* **Restore capsule data** from the user's hive vault.
* **Work offline**: if there is no network when data is saved, a local copy is kept and synchronized later with the hive vault.
* Work well with multi devices: **operations can be synchronized on multiple devices**. For example, an installed capsule on a first device can be automatically installed on another device without user interaction.

## Initial setup

```javascript
let hiveAuthHelper = new TrinitySDK.Hive.AuthHelper();
let hiveClient = await hiveAuthHelper.getClientWithAuth();
let userVault = await hiveClient.getVault(userDID);
let backupRestoreHelper = new TrinitySDK.Backup.BackupRestoreHelper(userVault);
```

## Add a sync context

A sync context is a context in which we backup and restore **items of the same kind**. For example, the same capsule may want to store a "friends list" and a "messages list". In this case, it will use 2 different sync contexts.

Sync contexts must be initialized once per capsule execution:

```javascript
backupRestoreHelper.addSyncContext(anyContextName, async (entry)=>{
    // Insertion request from the backup helper
    return true;
}, async (entry)=>{
    // Modification request from the backup helper
    return true;
}, async (entry)=>{
    // Deletion request from the backup helper
    return true;
});
```

The above method has **3 callbacks**. Those callbacks are called when the helper notices that **some information is different between the local copy, and the hive vault copy**.

In case data is newly inserted on the vault and doesn't exist locally, the **"insertion"** callback is called. This happens after a reinstallation (nothing exists locally), or if another device has inserted a new entry to be backup recently.

The **modification** callback is called when a backup entry (same entry "key" in the context) has been modified. For example, another device edits one of the app settings.

The **deletion** callback is called in case of remote deletion. For example in the elastOS launcher, if user's second device deletes a capsule, then the first device will receive this deletion callback. This is how the capsule uninstallation can be "synchronized" among user's devices.

Those **callbacks are called during the synchronization process** (sync() method called).

**Each callback is responsible to return true or false**. This returned value is important because **this is how the backup restore helper knows if a synchronization has succeeded** (therefore not retry it) or not. For example, in case the insertion callback is called but for any reason you fail to insert the received entry locally, you may return false. This way, the synchronization process will stop for now, and will be retried later.

**Those 3 callbacks must update only the local application model**, and **not** call upsertDatabaseEntry() or deleteDatabaseEntry(). The backup restore helper does this by itself in case of successful synchronization.

Also note that as those callbacks use async/await, **the executed operations can be not instant**. For example, when receiving an insertion callback, a capsule could device to ask the user if he really wants to insert the remotely modified entry (ex: by user's second phone) or not. If the user accepts, the local insertion may be done by the capsule (and return true). If the user refuses, the local insertion may NOT be done, but still return true, to let the helper know that the sync was successful. Returning false from callbacks may be done only in case of real errors during the process.

## Registering entries to backup

All entries that you want to backup must be "registered" (added, updated) to this helper. Each entry must have a unique key, and this unique key will be used later to compare the entry modification times with hive vault copies, therefore know if the local copy should be uploaded to the vault, or if the vault copy should come to overwrite the local copy.

Insert a new entry, or update an existing one:

```javascript
await backupRestoreHelper.upsertDatabaseEntry(anyContextName, uniqueEntryKey, {
    customAppDataForThisEntry: "abc"
});
```

## Delete an entry

```javascript
backupRestoreHelper.deleteDatabaseEntry("localmodel1", uniqueEntryKey);
```

## Starting the synchronization process

The following method synchronizes all entries from all sync contexts and stops as soon as a callback (insertion, modification, deletion) returns false.

```javascript
await backupRestoreHelper.sync();
// Callback registered in addSyncContext() will be called during this process
```

**Note**: a synchronization is automatically started every time upsertDatabaseEntry() and deleteDatabaseEntry() are called.

It's up to your capsule to decide when you prefer to synchronize to the hive vault. This could be often or less often, but always keep in mind that the sync operation is an intenside operation (CPU, network).

## Debugging

For convenience during development, it's sometimes useful to wipe backup restore helper local contexts and entries in order to restart from scratch:

```javascript
backupRestoreHelper.wipeLocalContextData(anyContextName);
```

## How to get active user's DID?

Here is how to request current user's DID from the identity capsule:

```javascript
appManager.sendIntent("credaccess", {
    claims: {}
}, null, (response: {result: { did: string, presentation: string }}) => {
    if (response && response.result.did) {
        userDID = response.result.did;
    }
}, (err)=>{});
```

## How to better debug operations using this helper?

You can get more verbose logs to better understand what's going on during synchronizations, using the following constructor method:

```javascript
let backupRestoreHelper = new TrinitySDK.Backup.BackupRestoreHelper(userVault, true);
```