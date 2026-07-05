::mods_registerMod("mod_company_blessings", 0.01, "Company Blessings");

::mods_queue("mod_company_blessings", null, function() {
	::mods_registerCSS("screens/world/modules/world_town_screen/world_town_screen_temple_dialogue_module.css");
	::mods_registerJS("screens/world/modules/world_town_screen/world_town_screen_temple_dialogue_module.js");

	::mods_registerJS("company_blessings_shim.js");

	// ::include("script_hooks/bdp_crownling_spawns");
});
