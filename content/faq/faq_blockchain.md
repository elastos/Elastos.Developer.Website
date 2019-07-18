+++
title = "FAQ: Blockchain"
date = 2019-05-24T21:15:33+02:00
weight = 20
chapter = false
pre = "<i class='fa ela-page'></i> "
alwaysopen = false
+++ 

{{< ownership "?" >}}

{{< checkme >}}

{{% faqentry question="What is a blockchain really?" %}}
It is a decentralized ledger. A way to make sure that every content stored remains accessible and unaltered forever.
{{% /faqentry %}}

{{% faqentry question="How do you run an application efficiently on a ledger? " %}}
It is not possible. All those so called DApp platforms therefore rely on off chain solutions which is just a fancy word for the internet. Everything that doesn‘t run directly on the blockchain is not secure and not decentralized. That is where Elastos is different.
{{% /faqentry %}}

{{% faqentry question="On which blockchain is ELA built?" %}}
ELA has its own blockchain. Its mainnet is live since December 2017.
{{% /faqentry %}}

{{% faqentry question="Where can I see the ELA blockchain?" %}}
On the [blockchain explorer](https://blockchain.elastos.org/).
{{% /faqentry %}}

{{% faqentry question="Is the ELA blockchain decentralized?" %}}
Yes, Elastos merge mines with Bitcoin. Meaning it is as decentralized as Bitcoin and additionally it has a DPoS system to sign off every transaction.
{{% /faqentry %}}

{{% faqentry question="What is a sidechain?" %}}
It is a blockchain that can only function in the Elastos environment. Unlike projects with congested blockchains, DApps on Elastos use sidechains to fulfil their needs and approach almost infinite scalability. Sidechain can have their own token, smart contracts and be integrated in Elastos.
{{% /faqentry %}}

{{% faqentry question="Yes but what is the sidechain on?" %}}
It is independent, it is a complete blockchain. Its characteristic is that it can only communicate with Elastos.
{{% /faqentry %}}

{{% faqentry question="What is a friendchain?" %}}
A friendchain is an independent blockchain outside the elastos ecosystem that provides atomic swaps or DEX capabilities with the elastos chain.
{{% /faqentry %}}

{{% faqentry question="How will ELA gain value?" %}}
{{< internallink "Read about the tokenomics of ELA." "/concepts/blockchain/tokenomics.md" >}}
{{% /faqentry %}}

{{% faqentry question="Is there a lockup program?" %}}
A lockup program finished in February 2018. You could choose to lock up a minimum of 300 ELA for 1, 2 or 3 years. You would get an interest on your locked up tokens of +4%, 5+% , +6% respectively for the first, second and third year respectively (not compounding).
{{% /faqentry %}}

{{% faqentry question="Can I participate in this lockup program or a program to come?" %}}
No. There will be no other lockup program.
{{% /faqentry %}}

{{% faqentry question="Why will there not be another lockup program?" %}}
For juridical reasons (among other because of the SEC).
{{% /faqentry %}}

{{% faqentry question="How do the airdrops work?" %}}
Elastos ecosystem collaboration projects (dapps built on Elastos in collaboration with Elastos) have to lock no less than 2-5% of their project tokens published for converting into ELA. 20% of the project tokens (converted to ELA) will be used for Elastos foundation development. 80% of the actual project tokens will be rewards shared by all ELA holders. 
{{% /faqentry %}}

{{% faqentry question="What is Elastos’ algorithm?" %}}
SHA-256 just like Bitcoin.
{{% /faqentry %}}

{{% faqentry question="Can the ELA blockchain be forked?" %}}
The ELA blockchain is made not to be forked. Elastos developed their merge mining software with Bitcoin to prevent a fork. The DPoS system is added as an extra precaution against forking.
{{% /faqentry %}}

{{% faqentry question="Nonetheless, nothing prevents the forking of this open source blockchain correct?" %}}
Yes but forking ELA offers little interest as ELA forks will be incompatible with Elastos ecosystem already in place.
{{% /faqentry %}}

{{% faqentry question="Where do the transaction fees of each ELA transaction go?" %}}
The fees go to the miners.
{{% /faqentry %}}

{{% faqentry question="How will Elastos handle the scalability issues?" %}}
Through its mainchain and sidechain architecture.
{{% /faqentry %}}

{{% faqentry question="How does the mainchain and sidechain architecture work?" %}}
{{< internallink "Read this article." "/concepts/blockchain/_index.md" >}}
{{% /faqentry %}}

{{% faqentry question="Does Elastos have an equivalent to the ERC20 token?" %}}
No but it most likely will in the future once Elastos is fully released.
{{% /faqentry %}}


{{% faqentry question="Can an existing project running on for example Ethereum or NEO achieve superior performance by default by running on top of Elastos or can something like this only be the case if the Ethereum or NEO network is experiencing bandwidth issues?" %}}

That’s a tough question to answer because it depends. NEO or Eth DApps are not completely decentralized so a lot of data these apps host are still saved in some centralized servers. Only the critical component and smart contracts are stored on Blockchain. So a centralized solution or part centralized-decentralized solution is always faster or at least easier to get it up and running fast. You can decide to switch to elastos hybrid app as well where you have part centralized-decentralized solution and this speed would be comparable or faster sometimes. For pure elastos apps, these are completely decentralized. These will be slow at first but obviously they can be customized so they’re fast as well. It’s just that decentralized solution is going to be slower in general. This will change when we have lots of carrier nodes but for now, it would be slower. 

{{% /faqentry %}}

{{% faqentry question="If they decide to do so, will the existing friendchains of NEO and Ethereum have cross-chain compatibility with the newly created sidechain on Elastos?" %}}

They would all have to go through elastos main chain. These sidechains wouldn’t be able to directly have interoperability with public chains. This is my understanding so far. Things might change in the future. At the moment, if two sidechains wanna interoperate with each other, they also always go through elastos main chain. But again, this might also change in the future where they might not need to go through main chain. It’s still in development so it’s hard to say at this point.

{{% /faqentry %}}

{{% faqentry question="Let's say a friendchain and sidechain run side by side, are they then able to guarantee more uptime and general robustness or would they experience more downtime in case one of them runs into issues of any kind? Can the friendchain or sidechain affect the robustness of its counterpart in any way is what I am wondering?" %}}

I’m just trying to understand why a sidechain and a friendchain would need to interact so much with each other. In fact, it should be the other way around where the idea of a sidechain is so that the request doesn’t need to go outside of elastos ecosystem so everything is easy to implement and also faster and more robust. DApps should be able to just work fine by just interacting with the sidechains on elastos. When you port ethereum to elastos, it means this would be a sidechain and elastos apps can directly have ethereum smart contracts via the sidechain. Sidechains always live within the elastos ecosystem. Friendchains on the other hand are other public Blockchains which live outside the elastos ecosystem. So ethereum public chain will always be a friendchain. A ported ethereum will be called a sidechain and the team can even decide to change the name from ethereum to something else so as to avoid confusion since they’re different. That’s the basic idea of sidechains and friendchains

{{% /faqentry %}}

{{% faqentry question="Can Elastos also offer its digital identity security to its sidechains? NEO for example recently was suffering from spam attacks. Could the Elastos digital identity (DID) make it possible to block or provide temporary time outs to network spammers as a possible solution (in a way somewhat similar to how DDOS attacks are stopped on Elastos)?" %}}
    
That’s exactly the purpose of these sidechains. First of all, there are two kinds of sidechains on elastos. There’s a system level sidechain and a 3rd party sidechain. Examples of a system level sidechain are ID sidechain, digital assets sidechain, token generation sidechain, etc. An example of a 3rd party sidechain would be a ported ethereum or ported neo sidechain. 

{{% /faqentry %}}

{{% faqentry question="The first of Four pillars comprising Elastos Ecosystem is, “Blockchain and Smart Contracts“.  Rong has stated in several interviews and talks that code, specifically smart contracts, will not and should not run on the blockchain layer (Like Ethereum). Was combining blockchain and smart contracts into one pillar just a matter of convenience for marketing or is there a reason to have them comprise the same pillar?" %}}

Elastos Blockchain is a multi-tier architecture so both blockchain and smart contracts are in this same architecture. Main chain - sidechain structure.

{{% /faqentry %}}