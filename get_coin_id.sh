#!/bin/bash

find_nftid=$1
result=""

wallet_list=$(chia wallet show -w nft | grep "Wallet ID" | cut -c 28- | tr '\n' ' ')

for wallet in $wallet_list; do

#   echo "Checking Wallet ID: $wallet"

   count=$(chia rpc wallet nft_count_nfts '{"wallet_id":'$wallet'}' | jq -r '.count')
   nft_id_list=$(chia rpc wallet nft_get_nfts '{"wallet_id":'$wallet', "start_index":0, "num":'$count', "ignore_size_limit": false}' | grep -A 1 "nft_coin_id" | cut -c 13- | sed '/nft_coin_id/{N;s/\n/ /;}' | tr -s '\n'| tr -d ' ' && echo "")

   for nft in $nft_id_list; do

#      echo -n "."

      nft_id=$(echo "$nft" | cut --fields 8 --delimiter=\" )
      coin_id=$(echo "$nft" | cut --fields 4 --delimiter=\" )

      if [ "$find_nftid" == "$nft_id" ]; then
         result="$coin_id"
 #        echo ""
         break 2
      fi

   done

#   echo ""

done

echo "$result"
