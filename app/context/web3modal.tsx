"use client";

import { createWeb3Modal, defaultConfig } from "@web3modal/ethers5/react";

// 1. Get projectId
const projectId = process.env.WEB3MODAL_PROJECT_ID || "c2a677c03e3ef0d4f4a2a22d3a7dd26f";


// 2. Set chains
const mainnet = {
  chainId: 1,
  name: "Ethereum",
  currency: "ETH",
  explorerUrl: "https://etherscan.io",
  rpcUrl: "https://cloudflare-eth.com",
};

// 3. Create modal
const metadata = {
  name: "My Website",
  description: "My Website description",
  url: "https://mywebsite.com",
  icons: ["https://avatars.mywebsite.com/"],
};

createWeb3Modal({
  ethersConfig: defaultConfig({ metadata }),
  chains: [mainnet],
  projectId,
});

export function Web3ModalProvider({ children }: { children: React.ReactNode }) {
  return children;
}


//'use client'

// import { createAppKit } from '@reown/appkit/react'
// // import { Ethers5Adapter } from '@reown/appkit-adapter-ethers5'
// import { EthersAdapter } from '@reown/appkit-adapter-ethers'
// import { mainnet, arbitrum } from '@reown/appkit/networks'

// // const projectId = 'YOUR_PROJECT_ID'

// // 2. Create a metadata object
// const metadata = {
//   name: 'My Website',
//   description: 'My Website description',
//   url: 'https://mywebsite.com', // origin must match your domain & subdomain
//   icons: ['https://avatars.mywebsite.com/']
// }

// // 3. Create the AppKit instance
// createAppKit({
//   // adapters: [new Ethers5Adapter()],
//   // metadata: metadata,
//   adapters: [new EthersAdapter()],
//   metadata,
//   networks: [mainnet, arbitrum],
//   projectId,
//   features: {
//     analytics: true // Optional - defaults to your Cloud configuration
//   }
// })

// export const Web3ModalProvider = (
//   { children }: { children: React.ReactNode }
// ) => {
//   return children
// }
