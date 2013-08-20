/"CycleCount"/ { cycleCount = $3 }
/"CurrentCapacity"/ { currentCapacity = $3 }
/"MaxCapacity"/ { maxCapacity = $3 }
/"DesignCapacity"/ { designCapacity = $3 }
/"ExternalConnected"/ { externalConnected = $3 }
END { OFS=","; print date, cycleCount, designCapacity, maxCapacity, currentCapacity, externalConnected }