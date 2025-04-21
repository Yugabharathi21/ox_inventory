# ox_inventory SPZ Edition

A modernized and enhanced version of ox_inventory with a futuristic UI design and additional features.

![](https://img.shields.io/github/downloads/overextended/ox_inventory/total?logo=github)
![](https://img.shields.io/github/downloads/overextended/ox_inventory/latest/total?logo=github)
![](https://img.shields.io/github/contributors/overextended/ox_inventory?logo=github)
![](https://img.shields.io/github/v/release/overextended/ox_inventory?logo=github)

## 📚 Documentation

https://overextended.dev/ox_inventory

## 💾 Download

https://github.com/overextended/ox_inventory/releases/latest/download/ox_inventory.zip

## Supported frameworks

We do not guarantee compatibility or support for third-party resources.

- [ox_core](https://github.com/overextended/ox_core)
- [esx](https://github.com/esx-framework/esx_core)
- [qbox](https://github.com/Qbox-project/qbx_core)
- [nd_core](https://github.com/ND-Framework/ND_Core)

## ✨ Features

- Server-side security ensures interactions with items, shops, and stashes are all validated.
- Logging for important events, such as purchases, item movement, and item creation or removal.
- Supports player-owned vehicles, licenses, and group systems implemented by frameworks.
- Fully synchronised, allowing multiple players to [access the same inventory](https://user-images.githubusercontent.com/65407488/230926091-c0033732-d293-48c9-9d62-6f6ae0a8a488.mp4).

### Items

- Inventory items are stored per-slot, with customisable metadata to support item uniqueness.
- Overrides default weapon-system with weapons as items.
- Weapon attachments and ammo system, including special ammo types.
- Durability, allowing items to be depleted or removed overtime.
- Internal item system provides secure and easy handling for item use effects.
- Compatibility with 3rd party framework item registration.

### Shops

- Restricted access based on groups and licenses.
- Support different currency for items (black money, poker chips, etc).

### Stashes

- Personal stashes, linking a stash with a specific identifier or creating per-player instances.
- Restricted access based on groups.
- Registration of new stashes from any resource.
- Containers allow access to stashes when using an item, like a paperbag or backpack.
- Access gloveboxes and trunks for any vehicle.
- Random item generation inside dumpsters and unowned vehicles.

## Copyright

Copyright © 2024 Overextended <https://github.com/overextended>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

## Features

### Main Branch
- Classic inventory system with standard grid layout
- Basic item management functionality
- Default ox_inventory styling
- Traditional inventory controls

### SPZ-Inventory-Additions Branch
![SPZ Inventory Preview](https://media.discordapp.net/attachments/1102795281726185493/1363703714690633768/image.png?ex=6806ff8d&is=6805ae0d&hm=82221ebc0b9248a78bc5eb7b1c48b29c7b6360a513f66b130644353f50478ef6&=&format=webp&quality=lossless&width=1604&height=902)

#### New Features
- Futuristic UI design with cyan accents and modern aesthetics
- Body image integration on the left side
- Enhanced inventory grid layout
- Improved item visualization
- Advanced styling features:
  - Glowing borders with hover effects
  - Clipped corners for a sci-fi look
  - Dynamic grid overlays
  - Smooth transitions and animations
  - Health/durability indicators
  - Compact item labels with improved readability

#### UI Improvements
- Modernized inventory slots with:
  - Translucent backgrounds
  - Cyan border accents
  - Corner triangles for visual interest
  - Improved item count display
  - Enhanced durability bars
  - Health status indicators
- Responsive layout with proper spacing
- Improved typography using Orbitron font
- Enhanced visual feedback on interactions

#### Technical Enhancements
- Optimized image rendering
- Improved performance with hardware acceleration
- Better organization of SCSS components
- Responsive grid system
- Enhanced accessibility features

## Comparison with Main Branch
![Main Branch Preview](https://media.discordapp.net/attachments/1102795281726185493/1363704261086675056/Screenshot_2025-04-21_074651.png?ex=68070010&is=6805ae90&hm=439f6d71f8e6d1eb49be7993821fb9a46d75d7333ce6006067aeaa5f88baeedc&=&format=webp&quality=lossless&width=1604&height=902)

The main branch features the traditional ox_inventory layout, while the SPZ-Inventory-Additions branch introduces significant visual and functional improvements for a more modern gaming experience.

## Installation

1. Clone the repository
2. Choose your preferred branch:
   - `main` for the classic experience
   - `spz-inventory-additions` for the enhanced UI
3. Follow standard ox_inventory installation procedures

## Contributing

Contributions are welcome! Please feel free to submit pull requests with new features or improvements.

## Credits

- Original ox_inventory developers
- SPZ team for UI enhancements
- Community contributors

## License

This project is licensed under the same terms as the original ox_inventory.
