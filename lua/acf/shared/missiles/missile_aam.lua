
--define the class
ACF_defineGunClass("AAM", {
    type            = "missile",
	spread          = 1,
	name            = "Air-To-Air Missile",
	desc            = "Missiles specialized for air-to-air flight.  These missiles have limited range, but are agile and can be radar-guided.",
	muzzleflash     = "40mm_muzzleflash_noscale",
	rofmod          = 1,
	sound           = "acf_extra/airfx/rocket_fire2.wav",
	soundDistance   = " ",
	soundNormal     = " ",
    effect          = "Rocket Motor",

    reloadmul       = 8,

    ammoBlacklist   = {"AP", "APHE", "FL", "HEAT"} -- Including FL would mean changing the way round classes work.
} )



-- BALANCE RATIONALE (open to discussion during development):
-- AAMs should be feasible in air-to-air combat but less feasible from the ground.
-- They will usually be launched from fast-moving aircraft.  Typical dogfighting distances are smaller than typical SAM engagement distances.
-- AAMs will have less time to adjust course before meeting their target due to decresed engagement range, and may be launched off-course due to flight.

-- With this in mind:
--      AAMs should be more powerful than SAMs of equivalent caliber.
--      AAMs should have weaker motors than SAMs of equivalent caliber.
--      AAMs should have less propellant than SAMs of equivalent caliber.
--      AAMs should be more manouverable than SAMs of equivalent caliber.
--      AAMs should be more agile than SAMs of equivalent caliber.
--      AAMs should have larger viewcones than SAMs of equivalent caliber.



--[[
-- Not based on any real missile - this is for smaller aircraft.
-- Balance the round in line with the 40mm pod rocket.
ACF_defineGun("40mmAAM", { --id
	name = "40mm Air-to-air Missile",
	desc = "Someone glued a radar dish to a firework.  It's puny, short-range and goes pop instead of boom. It's also fast and agile, like the tiny aircraft you'll be putting this on.",
	model = "models/missiles/70mmffar.mdl",
	gunclass = "AAM",
    rack = "4xRK",  -- Which rack to spawn this missile on?
	length = 45,
	caliber = 4.0,
	weight = 35,    -- Don't scale down the weight though!
	year = 1953,
	round = {
		model		= "models/missiles/70mmffar.mdl",
		rackmdl		= "models/missiles/70mmffar.mdl",
		maxlength	= 32,
		casing		= 0.2,	        -- thickness of missile casing, cm
		armour		= 5,				-- effective armour thickness of casing, in mm
		propweight	= 1,	        -- motor mass - motor casing
		thrust		= 8000,	    -- average thrust - kg*in/s^2
		burnrate	= 450,	        -- cm^3/s at average chamber pressure
		starterpct	= 0.15,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 8000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.002,		-- drag coefficient of the missile
		finmul		= 0.003			-- fin multiplier (mostly used for unpropelled guidance)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = ACF_GetAllGuidanceNames(),
    fuses       = ACF_GetAllFuseNames(),

    seekcone    = 40,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)
    viewcone    = 60,   -- getting outside this cone will break the lock.  Divided by 2.

    agility     = 1     -- multiplier for missile turn-rate.
} )
]]



-- The sidewinder analogue. we have to scale it down because acf is scaled down.
-- Balance the round in line with the 70mm pod rocket.
ACF_defineGun("AIM-9 AAM", { --id
	name = "AIM-9 Missile",
        desc = "The gold standard in airborne jousting sticks. Fast and agile, this infrared-homing missile is the weapon of choice for medium-range aerial combat.",
	model = "models/missiles/aim9m.mdl",
	gunclass = "AAM",
    rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 200,
	caliber = 9,
	weight = 85,    -- Don't scale down the weight though!
	rofmod = 0.5,
	year = 1953,
	round = {
		model		= "models/missiles/aim9m.mdl",
		rackmdl		= "models/missiles/aim9m.mdl",
		maxlength	= 25,
		casing		= 0.2,	        -- thickness of missile casing, cm
		armour		= 5,			-- effective armour thickness of casing, in mm
		propweight	= 1,	        -- motor mass - motor casing
		thrust		= 100000,	    -- average thrust - kg*in/s^2
		burnrate	= 350,	        -- cm^3/s at average chamber pressure
		starterpct	= 0.2,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 20000,		-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.006,		-- drag coefficient while falling
                dragcoefflight  = 0.06,                 -- drag coefficient during flight
		finmul		= 0.006			-- fin multiplier (mostly used for unpropelled guidance)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Radar"},
    fuses       = ACF_GetAllFuseNames(),

	racks       = {["1xRK"] = true,  ["2xRK"] = true},   -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

    seekcone    = 25,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)
    viewcone    = 30,   -- getting outside this cone will break the lock.  Divided by 2.

    agility     = 2.0,  -- multiplier for missile turn-rate.
    armdelay    = 0.4     -- minimum fuse arming delay
} )




-- The phoenix analogue. we have to scale it down because acf is scaled down.  It's also short-range due to AAM guidelines.
-- Balance the round in line with the 70mm pod rocket.
ACF_defineGun("AIM-120 AAM", { --id
	name = "AIM-120 Missile",
	desc = "The big guy of the skies - you're not getting any closer to a nuclear dogfight than this. Even faster than the AIM-9, but also a lot heavier. This long-range missile is sure to deliver one heck of a blast upon impact.",
	model = "models/missiles/aim120c.mdl",
	gunclass = "AAM",
    rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 1000,
	caliber = 12.0,
	weight = 152,    -- Don't scale down the weight though!
	year = 1991,
    modeldiameter = 7.1 * 2.54, -- in cm
	round = {
		model		= "models/missiles/aim120c.mdl",
		rackmdl		= "models/missiles/aim120c.mdl",
		maxlength	= 40,
		casing		= 0.4,	        -- thickness of missile casing, cm
		armour		= 10,			-- effective armour thickness of casing, in mm
		propweight	= 3,	        -- motor mass - motor casing
		thrust		= 200000,	    -- average thrust - kg*in/s^2
		burnrate	= 800,	        -- cm^3/s at average chamber pressure
		starterpct	= 0.15,          -- percentage of the propellant consumed in the starter motor.
		minspeed	= 25000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.007,		-- drag coefficient while falling
                dragcoefflight  = 0.07,                 -- drag coefficient during flight
		finmul		= 0.005			-- fin multiplier (mostly used for unpropelled guidance)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Radar"},
    fuses       = ACF_GetAllFuseNames(),

	racks       = {["1xRK"] = true},   -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

    seekcone    = 20,   -- getting inside this cone will get you locked.  Divided by 2 ('seekcone = 40' means 80 degrees total.)
    viewcone    = 25,   -- getting outside this cone will break the lock.  Divided by 2.

    agility     = 1.2,    -- multiplier for missile turn-rate.
    armdelay    = 0.5     -- minimum fuse arming delay
} )
