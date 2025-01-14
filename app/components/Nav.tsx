import React from 'react'
import { ConnectButton } from '../context/ConnectButton'

const Nav = () => {
  return (
    <div className="flex flex-row justify-between items-center bg-white px-3 py-1">
      <div className="flex text-black">
        <div>Links 1</div>
        <div>Links 2</div>
        <div>Links 3</div>
      </div>

      <div>
        <w3m-button />
      </div>
    </div>
  )
}

export default Nav