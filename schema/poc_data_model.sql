client
--
ID uuid FK >- tarifario.client_id
first_name  varchar
last_name varchar
national_id int
email varchar
country array
city varchar
street text
lat int
lng int
phone int
phone_opt int
client_type varchar
proposal_id FK >- proposal."proposal_materials.id" uuid

country
--
id uuid
country_name varchar
country_code varchar
country_number int

agent
--
id uuid FK >- proposal."agent_id.id"
role varchar
email varchar
phone int

roles
--
admin varchar
agent varchar
accountant varchar

supplier
--
id uuid
name varchar
phone int
email varchar
contact_name varchar
city varchar
country varchar
supplier_type varchar

proposal
--
id uuid
number int
date date
proposal_materials.id fk uuid
client_id.id FK >- client.ID uuid
agent_id.id fk uuid
plant_size int
labor_supplier_id uuid FK >- labor.id 


phase1_structure_cost
--
id uuid
date date
cost_in_usd_per_watt float
proposal_id uuid FK >- proposal.id

proposal_materials_phase1
--
id uuid FK >- proposal."proposal_materials.id"
client_id uuid FK >- client.id
solar_panel_id uuid FK >- solar_panel.id
solar_panel_cost_in_usd int #related to the panel id
solar_panel_qty_needed int #calculated field
solar_inverter_id uuid FK >- solar_inverter.id
solar_inverter_qty_needed int #calculated field
solar_inverter_unit_cost int #related to the inverter id
labor_supplier_id uuid FK >- labor.id
labor_cost_in_usd float #related to the labor supplier id
phase1_structure_cost_id uuid FK >- phase1_structure_cost.id
phase1_structure_cost_in_usd_per_watt float  #related to the structure p1 id


proposal_materials
--
id uuid FK >- proposal."proposal_materials.id"
client_id uuid FK >- client.id
solar_plant_installation_area_id fk uuid
solar_panel varchar
solar_panel_cost_in_usd int
solar_panel_qty_needed int
solar_inverter_id fk uuid
solar_inverter_qty_needed int
solar_inverter_unit_cost int #it could be total cost after doing the calculated field#
rails_qty_needed int
rails_unit_cost int
installation_area int #calculated field from solar_plant_installation_area multiplying length x width#
solar_panels_rows int #calculated field from the available length and width of the roof taking into account the width
solar_cable_needed int

roof
--
id uuid
roof_type varchar
proposal_id FK >- proposal_materials.id uuid

solar_plant_installation_area
--
id uuid
proposal_id FK >- proposal.id uuid
roof_length int
roof_width int


solar_panel
--
id uuid
manufacturer_code int
internal_code int
brand_name varchar
model varchar
wattage int
length_mm int
width_mm int
supplier_id FK >- supplier.id varchar
cost_usd_per_watt float
material varchar #--mono, poly---#
efficiency float
tax_exempt boolean 
tax_id FK >- tax.id uuid

solar_inverter
--
id uuid FK >- proposal_materials.solar_inverter_id
manufacturer_code int
internal_code int
brand_name varchar
model varchar
size_kw float
output_voltage int
input_max_voltage int
unit_cost int
tax_exempt boolean 
tax_id FK >- tax.id uuid
supplier_id FK >- supplier.id varchar

rails
--
id uuid
manufacturer_code int
internal_code int
brand_name varchar
model varchar
length int
width int
height int
supplier_id FK >- supplier.id varchar
cost_usd_per_meter float
tax_exempt boolean 
tax_id FK >- tax.id uuid

solar_cable
--
id uuid
manufacturer_code int
internal_code int
brand_name varchar
model varchar
length int
thickness_mm float
max_voltage int
country_origin varchar
supplier_id FK >- supplier.id varchar
cost_usd_per_meter float
tax_exempt boolean 
tax_id FK >- tax.id uuid

smart_metter
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

tax
--
id uuid
tax_name varchar 
tax_rate float

mid_clamp
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
supplier_id FK >- supplier.id varchar
cost_usd_per_unit float
tax_exempt boolean 
tax_id FK >- tax.id uuid

end_clamp
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
supplier_id FK >- supplier.id varchar
cost_usd_per_unit float
tax_exempt boolean 
tax_id FK >- tax.id uuid

foot_clamp
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
supplier_id FK >- supplier.id varchar
cost_usd_per_unit float
tax_exempt boolean 
tax_id FK >- tax.id uuid

transformers
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
capacity_amp int
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

data_manager
--
id uuid
manufacturer_code int
internal_code int
brand_name varchar
model varchar
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

Contactor
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
capacity_amp int
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

main_panelboard
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

fuses
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
capacity_amp int
voltage_dc int
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid


current_transformer
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
capacity_kva int
voltage int
voltage_phase varchar #mono, trifasico#
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

AC_cable
--
id uuid
manufacturer_code int
internal_code int
brand_name varchar
model varchar
length int
thickness_mm float
max_voltage int
country_origin varchar
supplier_id fk varchar
cost_usd_per_meter float
tax_exempt boolean 
tax_id FK >- tax.id uuid

protection_system
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
cost_usd_per_unit float
supplier_id fk varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

breakers
--
id uuid
manufacturer_code int
internal_code int
model varchar
brand_name varchar
capacity_amp int
cost_usd_per_unit float
supplier_id FK >- supplier.id varchar
tax_exempt boolean 
tax_id FK >- tax.id uuid

labor
--
id uuid
labor_type varchar
cost_per_watt int
supplier_id varchar FK >- supplier.id



elect_invoice
--
id uuid
client_id FK >- client.ID uuid
distributor_id uuid
rate_type varchar
proposal_id uuid FK >- proposal.id
month_1_charge int
month_1_kw int
month_1_kwa int
month_2_charge int
month_2_kw int
month_2_kwa int
month_3_charge int
month_3_kw int
month_3_kwa int
month_4_charge int
month_4_kw int
month_4_kwa int
month_5_charge int
month_5_kw int
month_5_kwa int
month_6_charge int
month_6_kw int
month_6_kwa int
month_7_charge int
month_7_kw int
month_7_kwa int
month_8_charge int
month_8_kw int
month_8_kwa int
month_9_charge int
month_9_kw int
month_9_kwa int
month_10_charge int
month_10_kw int
month_10_kwa int
month_11_charge int
month_11_kw int
month_11_kwa int
month_12_charge int
month_12_kw int
month_12_kwa int

solar_plant_costs
--
id uuid
proposal_id FK >- proposal.id uuid
materials_id uuid

tarifario
--
id uuid
client_id uuid
tarifa varchar

distributor
--
id uud
name varchar

edesur_rates
--
id uuid FK >- elect_invoice.distributor_id
tarifa varchar FK >- tarifario.tarifa
bts1_cargo_fijo_0_100 int
bts1_cargo_fijo_101 int
bts1_energia_0_200 int
bts1_energia_201_300 int
bts1_energia_301_700 int
bts1_energia_701 int
bts2_cargo_fijo int
bts2_energia_0_200 int
bts2_energia_201_300 int
bts2_energia_301_700 int
bts2_energia_701 int
btd_cargo_fijo int
btd_energia int
btd_cargo_pot_max int
bth_cargo_fijo int
bth_energia int
bth_cargo_pot_hfp int
bth_cargo_hp int
mtd1_cargo_fijo int
mtd1_energia int
mtd1_cargo_pot_max int
mtd2_cargo_fijo int
mtd2_energia int
mtd2_cargo_pot_max int
mth_cargo_fijo int
mth_energia int
mth_cargo_pot_hfp int
mth_cargo_hp int

edenorte_rates
--
id uuid FK >- elect_invoice.distributor_id
tarifa varchar FK >- tarifario.tarifa
bts1_cargo_fijo_0_100 int
bts1_cargo_fijo_101 int
bts1_energia_0_200 int
bts1_energia_201_300 int
bts1_energia_301_700 int
bts1_energia_701 int
bts2_cargo_fijo int
bts2_energia_0_200 int
bts2_energia_201_300 int
bts2_energia_301_700 int
bts2_energia_701 int
btd_cargo_fijo int
btd_energia int
btd_cargo_pot_max int
bth_cargo_fijo int
bth_energia int
bth_cargo_pot_hfp int
bth_cargo_hp int
mtd1_cargo_fijo int
mtd1_energia int
mtd1_cargo_pot_max int
mtd2_cargo_fijo int
mtd2_energia int
mtd2_cargo_pot_max int
mth_cargo_fijo int
mth_energia int
mth_cargo_pot_hfp int
mth_cargo_hp int

edeeste_rates
--
id uuid FK >- elect_invoice.distributor_id
tarifa varchar FK >- tarifario.tarifa
bts1_cargo_fijo_0_100 int
bts1_cargo_fijo_101 int
bts1_energia_0_200 int
bts1_energia_201_300 int
bts1_energia_301_700 int
bts1_energia_701 int
bts2_cargo_fijo int
bts2_energia_0_200 int
bts2_energia_201_300 int
bts2_energia_301_700 int
bts2_energia_701 int
btd_cargo_fijo int
btd_energia int
btd_cargo_pot_max int
bth_cargo_fijo int
bth_energia int
bth_cargo_pot_hfp int
bth_cargo_hp int
mtd1_cargo_fijo int
mtd1_energia int
mtd1_cargo_pot_max int
mtd2_cargo_fijo int
mtd2_energia int
mtd2_cargo_pot_max int
mth_cargo_fijo int
mth_energia int
mth_cargo_pot_hfp int
mth_cargo_hp int

cepm_rates
--
id uuid FK >- elect_invoice.distributor_id
tarifa varchar FK >- tarifario.tarifa
bts1_cargo_fijo_0_100 int
bts1_cargo_fijo_101 int
bts1_energia_0_200 int
bts1_energia_201_300 int
bts1_energia_301_700 int
bts1_energia_701 int
bts2_cargo_fijo int
bts2_energia_0_200 int
bts2_energia_201_300 int
bts2_energia_301_700 int
bts2_energia_701 int
btd_cargo_fijo int
btd_energia int
btd_cargo_pot_max int
bth_cargo_fijo int
bth_energia int
bth_cargo_pot_hfp int
bth_cargo_hp int
mtd1_cargo_fijo int
mtd1_energia int
mtd1_cargo_pot_max int
mtd2_cargo_fijo int
mtd2_energia int
mtd2_cargo_pot_max int
mth_cargo_fijo int
mth_energia int
mth_cargo_pot_hfp int
mth_cargo_hp int

solar_irradiation
--
id uuid
client_id uuid FK >- client.id
client_lat float FK >- client.lat
client_lng float FK >- client.lng
january int
february int
March int
April int
May int
June int
July int
August int
September int
October int
November int
December int

co2_emissions
--
id uuid
january date
february date
March date
April date
May date
June date
July date
August date
September date
October date
November date
December date

so2_emissions
--
id uuid
january date
february date
March date
April date
May date
June date
July date
August date
September date
October date
November date
December date











