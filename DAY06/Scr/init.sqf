private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
ADF_endMission			= false;
ADF_init_AO				= false;
MotsActive				= false;
ADF_cacheCount			= 0;
ADF_cacheCnt				= 0;
ADF_endMissionMsg			= {diag_log "TWO SIERRA: ADF_endMissionMsg";};
ADF_fnc_CacheDestroyed	= {diag_log "TWO SIERRA: ADF_fnc_CacheDestroyed EH";};

// Server Init
if (isServer) then {
	#include "init_server.sqf"
};

// Client init
if (hasInterface) then {
	#include "init_client.sqf"
};

// HC init
if (ADF_isHC) then {
	#include "init_hc.sqf"
};

// All clients
execVM "Scr\ADF_CAS.sqf";

_diagTestEnd = diag_tickTime;
diag_log format ["ADF RPT: Init - FINISHED Scr\init.sqf  [%1]",_diagTestStart - _diagTestEnd];