### ProtexaPulse

A p2p insurance dapp developed for Chainlink Fall 2023 Hackathon.

#### Functionalities

General info based on VIN
https://en.vindecoder.pl/

Determine crashworthiness and rollover safety
https://api.nhtsa.gov/SafetyRatings/modelyear/2013/make/Acura/model/rdx
https://api.nhtsa.gov/SafetyRatings/VehicleId/7520

Manufacturers who determine that a product or piece of original equipment either has a safety defect, or is not in compliance with federal safety standards
https://api.nhtsa.gov/recalls/recallsByVehicle?make=acura&model=rdx&modelYear=2012

Complaint information entered into NHTSA’s Office of Defects Investigation vehicle owner's complaint
https://api.nhtsa.gov/complaints/complaintsByVehicle?make=acura&model=rdx&modelYear=2012

### Chainlink Utilization

#### Price Data Feeds:

- Risk Assessment and Premium Calculation: Utilize Chainlink's price data feeds to access real-time market data about car models, their parts, and repair costs. This information can be crucial for assessing the risk associated with insuring a particular vehicle and determining insurance premiums.
- Claims Settlement: When settling claims, you could use price data feeds to ensure payouts reflect current market values for repairs or replacements.

#### Off-Chain Computation:

- Customized Insurance Policies: Employ off-chain computation for processing complex algorithms that customize insurance policies based on user profiles, driving history, vehicle type, and other relevant data.
- Fraud Detection: Implement advanced algorithms off-chain to analyze claims and detect potential fraud, thus improving the reliability and credibility of your insurance platform.

#### Keepers:

- Policy Renewal and Payments: Chainlink Keepers can automate policy renewals and premium payments, ensuring they occur on schedule without requiring manual oversight.
- Trigger-based Insurance: Implement trigger-based insurance policies where, for instance, coverage is activated only under certain conditions (like long-distance travel), with Keepers automating the activation/deactivation process.

#### Crosschain Swaps:

- Multi-Currency Support: This feature can facilitate users to pay premiums or receive payouts in different cryptocurrencies or even fiat currencies, enhancing the flexibility and accessibility of your platform.
- Liquidity for Claims Settlement: Leverage crosschain swaps to ensure liquidity is always available for settling claims, regardless of the cryptocurrency in which premiums are paid.

#### VRF (Verifiable Random Function):

- Randomized Selection for Audits: Use Chainlink's VRF to randomly select policies for audit, ensuring a fair and unbiased process.
- Claims Processing: In certain types of insurance models, like mutual insurance where members decide on claim payouts, VRF can be used to randomly select the jury members from the pool of policyholders.

### Detailed Architecture

#### Data Storage with IPFS

IPFS, or the InterPlanetary File System, can be used to store data in a distributed manner. This can include insurance policy documents, user data, and claim documentation. To ensure privacy and security:

- Data stored on IPFS would be encrypted using public-key cryptography. Each user would have their unique keypair, and data relevant to them would be encrypted with their public key.
- Only the user with the corresponding private key could decrypt and view their data.
- Hashes of encrypted documents can be stored on a blockchain to ensure tamper-proofing and provide an immutable reference to the data.

#### Insurance Policy Terms Determination

- The terms of the insurance policy could be determined based on car data using smart contracts. Chainlink's price data feeds can provide real-time data on car valuations, repair costs, and parts prices.
- A smart contract would algorithmically calculate the risk associated with insuring the car based on its make, model, age, and other relevant data points provided by the user or external APIs.
- The smart contract would also consider the user's driving history if available from a connected database or a decentralized data source.
- The terms, including premium and coverage limits, would be dynamically generated and could adjust over time with updated data feeds.

#### Fraud Analysis

- Fraud analysis in a decentralized environment can use off-chain computation to maintain privacy while still leveraging the power of Chainlink's decentralized oracle network.
- When a claim is filed, the smart contract could trigger an off-chain computation that checks for anomalies or patterns that are indicative of fraud, such as duplicate claims, exaggerated repair costs, or mismatched data (e.g., a claim for a part that doesn’t match the car’s model).
- This analysis could utilize machine learning models trained on historical claims data.
- The results of the fraud analysis would be sent back to the smart contract to approve or flag the claim for further investigation.

#### Random Audit Selection

- Chainlink's VRF (Verifiable Random Function) would be used to ensure that the selection of insurance policies for audit is fair and tamper-proof.
- Periodically, or triggered by certain conditions, the smart contract would request a random number from Chainlink's VRF.
- The received random number would be used to select a policy from the pool of active policies, ensuring that every policy has an equal chance of being chosen.
- The audit process would then be initiated for the selected policy, which could involve a more detailed review of the policy terms and the claims history.

#### General Architecture

- A blockchain platform, such as Ethereum, to deploy smart contracts that handle policy terms, premium payments, claim filings, and fraud analysis triggers.
- Chainlink oracles are used to bring in external data and perform off-chain computations, as well as to execute random selections for audits.
- IPFS for decentralized file storage, with encryption to protect sensitive user data.
- A user interface (web or mobile app) that interacts with the smart contracts and allows users to request quotes, file claims, and view their policy details.
