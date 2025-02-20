///////////////////////////
/* LOW TEMPERATURE MOLDS */
///////////////////////////

// Hammer
/obj/item/castingmold/hammer
	name = "\improper clay hammer mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "hammer-claymold"
	mold_result = /obj/item/heatable/forged/hammer
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Pickaxe
/obj/item/castingmold/pickaxe
	name = "\improper clay pickaxe mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "pickaxe-claymold"
	mold_result = /obj/item/heatable/forged/pickaxe
	ingot_value = 2
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Hatchet
/obj/item/castingmold/hatchet
	name = "\improper clay hatchet mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "hatchet-claymold"
	mold_result = /obj/item/heatable/forged/hatchet
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Shovel
/obj/item/castingmold/shovel
	name = "\improper clay shovel mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "shovel-claymold"
	mold_result = /obj/item/heatable/forged/shovel
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Tongs
/obj/item/castingmold/tongs
	name = "\improper clay tongs mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "tongs-claymold"
	mold_result = /obj/item/heatable/forged/tongs
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Spear
/obj/item/castingmold/spear
	name = "\improper clay spear mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "spear-claymold"
	mold_result = /obj/item/heatable/forged/weapon/spear
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)


// Anvil
/obj/item/castingmold/anvil
	name = "\improper clay anvil mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "anvil-claymold"
	mold_result = /obj/structure/anvil
	ingot_value = 2
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)

/obj/item/castingmold/anvil/result()
	var/new_item
	switch(metal_contained)
		if("/obj/item/heatable/ingot/copper")
			new_item = new /obj/structure/anvil/copper(get_turf(src))
		if("/obj/item/heatable/ingot/bronze")
			new_item = new /obj/structure/anvil/bronze(get_turf(src))
	qdel(src)
	return new_item


// Arrowhead
/obj/item/castingmold/arrowhead
	name = "\improper clay arrowhead mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "arrow-claymold"
	mold_result = /obj/item/stack/arrowhead
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		)

/obj/item/castingmold/arrowhead/result()
	var/obj/item/new_item
	switch(metal_contained)
		if("/obj/item/heatable/ingot/copper")
			new_item = new /obj/item/stack/arrowhead/copper(get_turf(src))
		if("/obj/item/heatable/ingot/bronze")
			new_item = new /obj/item/stack/arrowhead/bronze(get_turf(src))
	new_item.amount = 8
	metal_contained = null
	cool_time = initial(cool_time)
	update_icon()
	return new_item


// Sheets
/obj/item/castingmold/sheet
	name = "\improper clay sheet mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "sheet-claymold"
	mold_result = /obj/item/stack/material
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		"/obj/item/heatable/ingot/tin",
		"/obj/item/heatable/ingot/lead",
		"/obj/item/heatable/ingot/silver",
		"/obj/item/heatable/ingot/gold",
		)

/obj/item/castingmold/sheet/result()
	var/new_item
	switch(metal_contained)
		if("/obj/item/heatable/ingot/copper")
			new_item = new /obj/item/stack/material/copper(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/bronze")
			new_item = new /obj/item/stack/material/bronze(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/tin")
			new_item = new /obj/item/stack/material/tin(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/lead")
			new_item = new /obj/item/stack/material/lead(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/silver")
			new_item = new /obj/item/stack/material/silver(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/gold")
			new_item = new /obj/item/stack/material/gold(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/wroughtiron")
			new_item = new /obj/item/stack/material/iron(get_turf(src), INGOT_VALUE)
		if("/obj/item/heatable/ingot/steel")
			new_item = new /obj/item/stack/material/steel(get_turf(src), INGOT_VALUE)
	metal_contained = null
	cool_time = initial(cool_time)
	update_icon()
	return new_item


// Knife
/obj/item/castingmold/knife
	name = "\improper clay anvil mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "knife-claymold"
	mold_result = /obj/item/weapon/material/kitchen/utensil/knife
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/bronze",
		)

/obj/item/castingmold/knife/result()
	var/new_item
	switch(metal_contained)
		if("/obj/item/heatable/ingot/bronze")
			new_item = new /obj/item/weapon/material/kitchen/utensil/knife/bronze(get_turf(src))
	metal_contained = null
	cool_time = initial(cool_time)
	update_icon()
	return new_item


// Ingot
/obj/item/castingmold/ingot
	name = "\improper clay ingot mold"
	icon = 'icons/obj/blacksmithing.dmi'
	icon_state = "ingot-claymold"
	mold_result = /obj/item/heatable/ingot
	ingot_value = 1
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		"/obj/item/heatable/ingot/brass",
		"/obj/item/heatable/ingot/tin",
		"/obj/item/heatable/ingot/lead",
		"/obj/item/heatable/ingot/silver",
		"/obj/item/heatable/ingot/gold",
		)



////////////////////////////
/* HIGH TEMPERATURE MOLDS */
////////////////////////////

// Ingot
/obj/item/castingmold/ingot/hightemp
	name = "\improper steel ingot mold"
	icon_state = "ingot-steelmold"
	fireable = FALSE
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		"/obj/item/heatable/ingot/brass",
		"/obj/item/heatable/ingot/tin",
		"/obj/item/heatable/ingot/lead",
		"/obj/item/heatable/ingot/silver",
		"/obj/item/heatable/ingot/gold",
		"/obj/item/heatable/ingot/wroughtiron",
		"/obj/item/heatable/ingot/steel",
		)

// Sheets
/obj/item/castingmold/sheet/hightemp
	name = "\improper steel sheet mold"
	icon_state = "sheet-steelmold"
	fireable = FALSE
	allowed_metals = list(
		"/obj/item/heatable/ingot/copper",
		"/obj/item/heatable/ingot/bronze",
		"/obj/item/heatable/ingot/tin",
		"/obj/item/heatable/ingot/lead",
		"/obj/item/heatable/ingot/silver",
		"/obj/item/heatable/ingot/gold",
		"/obj/item/heatable/ingot/wroughtiron",
		"/obj/item/heatable/ingot/steel",
		)