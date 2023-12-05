# get_coin_id

This Bash script will get the `nft_coin_id` for a given `nft_id`. The script will search all Wallet IDs until it finds the NFT ID, then return the Coin ID for the NFT.

## Parameters

- Parameter 1 = NFT ID

## Running the command

```
bash get_coin_id.sh <nft_id>

Example:
bash get_coin_id.sh nft1y4ff5f2dqdr7ss6hnq6mudwwpj03dpmd9vefdfks4t9hcmfe5acq3cyk7z

```

## How is this useful? 

If you've ever wanted to create a zero mojo NFT offer, you need to use the RPC (currently) and that requires the Coin ID for your NFT. Here is an format for creating a zero mojo NFT.

```

chia rpc wallet create_offer_for_ids '{"offer":{"COIN_ID_HERE":-1},"fee":0,"driver_dict":{},"validate_only":false}'

```

Be sure to replace `COIN_ID_HERE` with your Coin ID for your NFT.

Here is an real example:

```

chia rpc wallet create_offer_for_ids '{"offer":{"0xb0986cc156ab4fb6917722d400486ef9ecb2033d74aa553d0717eed6716e5e57":-1},"fee":0,"driver_dict":{},"validate_only":false}'

```
