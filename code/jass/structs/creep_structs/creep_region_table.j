library CreepRegionTable initializer init requires RectUtil

globals
    constant integer MAX_CREEP_REGIONS = 500
    CreepRegion array creepRegionTable
endglobals

function addCreepRegion takes integer creepTableId, integer freq, integer mobSize, integer mobProb, integer ambushFreq, rect rRect returns boolean
    local integer i = 0 //counter
    loop
        exitwhen i == MAX_CREEP_REGIONS
        if creepRegionTable[i] == 0 then //the slot is empty
            set creepRegionTable[i] = CreepRegion.create(creepTableId, freq, mobSize, mobProb, ambushFreq, rRect)
            return true
        endif
        set i = i + 1
    endloop
    return false
endfunction

function findCreepRegion takes region r returns CreepRegion
    local integer i = 0 //counter
    loop
        exitwhen i == MAX_CREEP_REGIONS
        if creepRegionTable[i].r == r then //we found the region
            return creepRegionTable[i]
        endif
        set i = i + 1
    endloop
    return -1
endfunction

function getCreepRegionTableSize takes nothing returns integer
    local integer i = 0
    local integer sum = 0 
    loop
        exitwhen i == MAX_CREEP_REGIONS
        if creepRegionTable[i] == 0 then
            return sum
        else
            set sum = sum + 1
        endif
        set i = i + 1
    endloop
    return sum
endfunction

function getCreepFromCreepRegionTable takes unit u returns Monster
    local integer i = 0
    loop
        exitwhen i == MAX_CREEP_REGIONS
        if creepRegionTable[i].creeps.unitInGroup(u) then
            return creepRegionTable[i].creeps.getMonsterByUnit(u)
        endif
        set i = i + 1
    endloop
    return 0
endfunction

function getCreepRegionByCreep takes Monster creep returns CreepRegion
    local integer i = 0
    loop
        exitwhen i == MAX_CREEP_REGIONS
        if creepRegionTable[i].creeps.monsterStructInGroup(creep) then
            return creepRegionTable[i]
        endif
        set i = i + 1
    endloop
    return 0
endfunction
        

private function init takes nothing returns nothing
    local rect rRect
    local CreepRegion cr
    //*********************************************
    //***************  AGON: Zone 1 - Top left ****
    //*********************************************
    //**************   left   bottom   right    top
    set rRect = Rect( -14976, 2560,   -7168,     7904)
    //call rectHighlight(rRect)
    //************************  crTable           freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( AGON_ZONE_1,      90,    1,     50,      30,       rRect)
    set creepRegionTable[AGON_ZONE_1] = cr
    //*********************************************
    //***************  AGON: Zone 2 - bottom left *
    //*********************************************
    //**************   left   bottom   right    top
    set rRect = Rect( -14976, -3744,   -9152,     2528)
    //call rectHighlight(rRect)
    //************************  crTable           freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( AGON_ZONE_2,      90,    1,     50,      35,       rRect)
    set creepRegionTable[AGON_ZONE_2] = cr
    //*********************************************
    //***************  AGON: Zone 3 - bottom right
    //*********************************************
    //**************   left   bottom   right    top
    set rRect = Rect( -9152, -3712,   -1184,     2400)
    //call rectHighlight(rRect)
    //************************  crTable           freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( AGON_ZONE_3,      90,    2,     50,      40,       rRect)
    set creepRegionTable[AGON_ZONE_3] = cr
    //*********************************************
    //***************  AGON: Zone 4 - Top right ***
    //*********************************************
    //**************   left   right   bottom    top
    set rRect = Rect( -7136, 2464,   -1312,     7360)
    //call rectHighlight(rRect)
    //************************  crTable           freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( AGON_ZONE_4,      80,    2,     50,      45,       rRect)
    set creepRegionTable[AGON_ZONE_4] = cr
    //*********************************************
    //***************  AGON: Zone 5 - top right strip
    //*********************************************
    //**************   left   bottom   right    top
    set rRect = Rect( -7168, 7360,   -1568,     7872)
    //call rectHighlight(rRect)
    //************************  crTable           freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( AGON_ZONE_5,      70,    1,     50,      20,       rRect)
    set creepRegionTable[AGON_ZONE_5] = cr
    //*********************************************
    //***************  AGON: Zone 5 - top right strip
    //*********************************************
    //**************   left   bottom   right    top
    set rRect = Rect( 3456, 11552,   9408,     14144)
    //call rectHighlight(rRect)
    //************************  crTable                   freq   size   +cr    ambushFreq
    set cr = CreepRegion.create( KALKA_SEWERS_ZONE_1,     60,    2,     50,      40,       rRect)
    set creepRegionTable[KALKA_SEWERS_ZONE_1] = cr
	set cr.spawnDistance = 500.0
	set cr.ambushDistance = 250.0
endfunction


endlibrary