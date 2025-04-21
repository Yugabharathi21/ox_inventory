import React from 'react';
import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';

const LeftInventory: React.FC = () => {
  const leftInventory = useAppSelector(selectLeftInventory);

  return (
    <div className="left-inventory-container">
      <div className="body-sidebar">
        <div className="body-title">BODY</div>
        <div className="body-image" />
      </div>
      <InventoryGrid inventory={leftInventory} />
    </div>
  );
};

export default LeftInventory;
