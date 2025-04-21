import React from 'react';
import { useDrag, useDrop } from 'react-dnd';
import { useAppSelector } from '../../store';
import { selectLeftInventory } from '../../store/inventory';
import { Items } from '../../store/items';
import { getItemUrl } from '../../helpers';
import { onDrop } from '../../dnd/onDrop';

const clothingSlots = [
    { id: 1, label: 'Head', position: 'left' },
    { id: 2, label: 'Face', position: 'left' },
    { id: 3, label: 'Eyes', position: 'left' },
    { id: 4, label: 'Neck', position: 'left' },
    { id: 5, label: 'Shirt', position: 'left' },
    { id: 6, label: 'Vest', position: 'right' },
    { id: 7, label: 'Pants', position: 'right' },
    { id: 8, label: 'Shoes', position: 'right' },
    { id: 9, label: 'Ear', position: 'right' },
    { id: 10, label: 'Watch', position: 'right' }
];

interface ClothingSlotProps {
    slot: number;
    item?: any;
    label: string;
}

const ClothingSlot: React.FC<ClothingSlotProps> = ({ slot, item, label }) => {
    const [{ isDragging }, drag] = useDrag(() => ({
        type: 'SLOT',
        item: { inventory: 'player', item: { name: item?.name, slot: item?.slot } },
        collect: (monitor) => ({
            isDragging: monitor.isDragging(),
        }),
    }));

    const [, drop] = useDrop(() => ({
        accept: 'SLOT',
        drop: (source: any) => {
            if (source.inventory === 'player') {
                onDrop(source, { inventory: 'player', item: { slot: slot } });
            }
        },
    }));

    return (
        <div className="clothing-slot" ref={drop}>
            <div className="clothing-slot-label">{label}</div>
            {item && (
                <div
                    className="clothing-slot-item"
                    ref={drag}
                    style={{ opacity: isDragging ? 0.4 : 1 }}
                >
                    <img src={getItemUrl(item)} alt={item.name} />
                </div>
            )}
        </div>
    );
};

const ClothingSlots: React.FC = () => {
    const leftInventory = useAppSelector(selectLeftInventory);
    const leftSlots = clothingSlots.slice(0, 5); // First 5 slots
    const rightSlots = clothingSlots.slice(5);   // Next 5 slots

    return (
        <div className="clothing-slots-wrapper">
            <div className="clothing-columns">
                <div className="clothing-column">
                    {leftSlots.map((slot) => {
                        const item = leftInventory.items.find((item) => item.metadata?.slot === slot.id);
                        return (
                            <ClothingSlot 
                                key={slot.id} 
                                slot={slot.id} 
                                item={item} 
                                label={slot.label} 
                            />
                        );
                    })}
                </div>
                <div className="clothing-column">
                    {rightSlots.map((slot) => {
                        const item = leftInventory.items.find((item) => item.metadata?.slot === slot.id);
                        return (
                            <ClothingSlot 
                                key={slot.id} 
                                slot={slot.id} 
                                item={item} 
                                label={slot.label} 
                            />
                        );
                    })}
                </div>
            </div>
        </div>
    );
};

export default ClothingSlots; 