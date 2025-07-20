// Flintlock Weapon assembly system made by Isaku the sprites were provided by mm2hn.
#define PISTOLBUTT "wood_frame_pistol"
#define PISTOLBUTTBARRELED "wood_frame_barrel_pistol"
#define RIFLEBUTT "wood_frame_rifle"
#define RIFLEBUTTBARRELED "wood_frame_barrel_rifle"
#define FMECH1 "flintlock_mechanism"

// GUN PARTS

/obj/item/assembly/blackpowder_weapon // Pistol Stock
	name = "Pistol Butt"
	desc = "A wooden blackpowder weapon's Butt"
	icon = 'icons/obj/guns/flintlocks.dmi'
	icon_state = PISTOLBUTT
	w_class = ITEM_SIZE_SMALL
	var/assembly_stage = PISTOLBUTT
	var/lock_type = null

/obj/item/assembly/blackpowder_weapon/rifle // Rifle Stock
	name = "Rifle stock"
	desc = "A wooden blackpowder rifle's Butt"
	icon_state = RIFLEBUTT
	assembly_stage = RIFLEBUTT
	w_class = ITEM_SIZE_NORMAL

/obj/item/assembly/blackpowder_weapon/barrel/pistol // Pistol Barrel
	name = "Pistol Barrel"
	desc = "The barrel of a pistol, made out of iron."
	icon_state = "pistol_barrel"
	w_class = ITEM_SIZE_SMALL

/obj/item/assembly/blackpowder_weapon/barrel/rifle // Rifle Barrel
	name = "Rifle Barrel"
	desc = "The barrel of a rifle, made out of iron."
	icon_state = "rifle_barrel"
	w_class = ITEM_SIZE_NORMAL

/obj/item/assembly/blackpowder_weapon/flintlock_mechanism // Flintlock Mechanism
	name = "Flintlock Mechanism"
	desc = "The parts making up a silex based firing mechanism, it has no flint inside yet."
	icon_state = "flintlock_mechanism"
	w_class = ITEM_SIZE_SMALL
	var/has_flint = FALSE

/obj/item/assembly/blackpowder_weapon/flintlock_mechanism/flint // Flintlock Mechanism
	name = "Flintlock Mechanism"
	desc = "The parts making up a silex based firing mechanism, it has a flint inside."
	w_class = ITEM_SIZE_SMALL

// ASSEMBLY SYSTEM
/obj/item/assembly/blackpowder_weapon/flintlock_mechanism/attackby(obj/item/weapon/W as obj, mob/user as mob) // System to put the flint in the mechanism
	if (istype(W, /obj/item/weapon/flint/sharpened))
		if (has_flint)
			user << "This flintlock mechanism already has a flint."
			return

		user << "You're inserting a flint into the mechanism..."
		if (do_after(user, 20, src))
			user << "You finish inserting the flint."
			has_flint = TRUE
			playsound(src, 'sound/weapons/switchblade.ogg', 50, 1)
			qdel(W)
		return
	..()

/obj/item/assembly/blackpowder_weapon/attackby(obj/item/weapon/W as obj, mob/user as mob) // Attaching barrel to pistol butt + flintlock mechanism
	if (istype(W, /obj/item/assembly/blackpowder_weapon/barrel))
		if (assembly_stage != PISTOLBUTT)
			user << "You can't attach that barrel right now."
			return
		user << "You start attaching the pistol barrel..."
		if (do_after(user, 20, src))
			user << "You finish attaching the pistol barrel."
			assembly_stage = PISTOLBUTTBARRELED
			icon_state = PISTOLBUTTBARRELED
			name = "Pistol Butt with Barrel"
			desc = "The pistol has a barrel, but still needs a firing mechanism."
			playsound(src, 'sound/effects/woodfile.ogg', 50, 1)
			qdel(W)
			return
	if (istype(W, /obj/item/assembly/blackpowder_weapon/flintlock_mechanism))
		if (assembly_stage == PISTOLBUTTBARRELED)
			var/obj/item/assembly/blackpowder_weapon/flintlock_mechanism/lock = W
			if (!lock.has_flint)
				user << "The flintlock mechanism doesn't have a flint and can't be assembled."
				return

			var/item_type = /obj/item/weapon/gun/projectile/flintlock/pistol
			user << "You start attaching the flintlock mechanism..."
			if (do_after(user, 20, src))
				user << "You finish assembling the flintlock pistol."
				playsound(src, 'sound/weapons/guns/interact/pistol_cock.ogg', 50, 1)
				var/obj/item/weapon/gun/projectile/flintlock/pistol/new_gun = new item_type()
				if (!user.put_in_hands(new_gun))
					new_gun.loc = user.loc
				qdel(W)
				qdel(src)
			return
/obj/item/assembly/blackpowder_weapon/rifle/attackby(obj/item/weapon/W as obj, mob/user as mob) // Attaching barrel to rifle stock + flintlock mechanism
	if (istype(W, /obj/item/assembly/blackpowder_weapon/barrel/rifle))
		if (assembly_stage != RIFLEBUTT)
			user << "You can't attach that barrel right now."
			return
		user << "You start attaching the rifle barrel..."
		if (do_after(user, 30, src))
			user << "You finish attaching the rifle barrel."
			assembly_stage = RIFLEBUTTBARRELED
			icon_state = RIFLEBUTTBARRELED
			name = "Rifle Butt with Barrel"
			desc = "The rifle has a barrel, but still needs a firing mechanism."
			playsound(src, 'sound/effects/woodfile.ogg', 50, 1)
			qdel(W)
			return
	if (assembly_stage == RIFLEBUTTBARRELED)
		var/item_type = /obj/item/weapon/gun/projectile/flintlock
		if (istype(W, /obj/item/assembly/blackpowder_weapon/flintlock_mechanism))
			var/obj/item/assembly/blackpowder_weapon/flintlock_mechanism/lock = W
			if (!lock.has_flint)
				user << "The flintlock mechanism doesn't have a flint and can't be assembled."
				return

			user << "You start attaching the flintlock mechanism..."
			if (do_after(user, 30, src))
				user << "You finish assembling the flintlock rifle."
				playsound(src, 'sound/weapons/guns/interact/pistol_cock.ogg', 50, 1)
				var/obj/item/weapon/gun/projectile/flintlock/new_gun = new item_type()
				if (!user.put_in_hands(new_gun))
					new_gun.loc = user.loc
				qdel(W)
				qdel(src)
			return
	..()