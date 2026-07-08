::mods_hookBaseClass("entity/tactical/player", function(a) {
	local onCombatStart = ::mods_getMember(a, "onCombatStart");
	local onCombatFinished = ::mods_getMember(a, "onCombatFinished");

	::mods_override(a, "onCombatStart", function() {
		onCombatStart();

    local blessingPerkID = this.World.Assets.CurrentBlessingID.perkID;

		if (this.hasPerk(blessingPerkID)) {
      this.m.AlreadyHadPerk = true;
      return true;
    }
    this.m.AlreadyHadPerk = false;

		local perk = this.Const.Perks.findById(blessingPerkID);

		if (perk == null) {
      return false;
    }

    this.m.Skills.add(this.new(perk.Script));
	});

	::mods_override(a, "onCombatFinished", function() {
    onCombatFinished();
    if (this.m.AlreadyHadPerk) {
      return true;
    }

    local blessingPerkID = this.World.Assets.CurrentBlessingID.perkID;
    this.m.Skills.removeByID(blessingPerkID);
	});
});
