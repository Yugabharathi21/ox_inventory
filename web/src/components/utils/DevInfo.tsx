import React from 'react';

export const DevInfo: React.FC = () => {
  return (
    <div className="dev-info-dialog">
      <div className="dev-info-title">Developer Information</div>
      <div className="dev-info-content">
        <p>
          This is a revamp/redesign of ox_inventory by Overextended (Ox).
        </p>
        <p>
          Redesigned by SPZ (<a href="https://github.com/yugabharathi21" target="_blank" rel="noopener noreferrer">@yugabharathi21</a>)
        </p>
        <p style={{ marginTop: '8px', opacity: 0.8 }}>
          Licensed under GNU General Public License v3.0
        </p>
      </div>
    </div>
  );
}; 