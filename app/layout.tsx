import "./globals.css";
import { Web3ModalProvider } from "./context/web3modal";
import Nav from "./components/Nav";

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <Web3ModalProvider>
          <Nav />
          <div>
            {children}
          </div>
        </Web3ModalProvider>
      </body>
    </html>
  );
}
