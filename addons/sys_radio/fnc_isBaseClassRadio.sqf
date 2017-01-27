/*
 * Author: ACRE2Team
 * Returns whether a classname is a base radio classname. This function exists because it is used frequently and config lookup is expensive.
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * Is Unique <BOOL>
 *
 * Example:
 * ["acre_prc152_id_1"] call acre_sys_radio_fnc_isBaseClassRadio
 *
 * Public: No
 */
#include "script_component.hpp"

if (HASH_HASKEY(GVAR(radioBaseClassCache),_this)) exitWith {
    HASH_GET(GVAR(radioBaseClassCache),_this);
};

private _configEntry = configFile >> "CfgWeapons" >> _this;
private _isBaseClassRadio = (getNumber(_configEntry >> "acre_hasUnique") == 1) && {getNumber(_configEntry >> "acre_isRadio") == 1};
HASH_SET(GVAR(radioBaseClassCache),_this,_isBaseClassRadio);

_isBaseClassRadio
