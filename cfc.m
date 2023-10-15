car_emission_per_km = 0.12;
plane_emission_per_km = 0.15;
electricity_emission_per_kWh = 0.5;
public_transport_emission_per_km = 0.05;
meal_emission = 1.0;

km_driven = input("Enter the number of kilometers you drive in a month: ");
km_flown = input("Enter the number of kilometers you fly in a year: ");
kWh_used = input("Enter your monthly electricity consumption in kWh: ");
km_on_public_transport = input("Enter the number of kilometers you travel on public transport in a month: ");
meals_per_month = input("Enter the number of meals you consume in a month: ");

car_footprint = km_driven * car_emission_per_km;
plane_footprint = km_flown * plane_emission_per_km;
electricity_footprint = kWh_used * electricity_emission_per_kWh;
food_footprint = meals_per_month * meal_emission;
public_transport_footprint = km_on_public_transport * public_transport_emission_per_km;

total_footprint = car_footprint + plane_footprint + electricity_footprint + food_footprint + public_transport_footprint;

fprintf("\nCarbon Footprint Breakdown:\n");
fprintf("Transport (Car): %f kg CO2\n", car_footprint);
fprintf("Travel (Plane): %f kg CO2\n", plane_footprint);
fprintf("Home Energy: %f kg CO2\n", electricity_footprint);
fprintf("Food Consumption : %f kg CO2\n", meals_per_month * meal_emission);
fprintf("Public Transport: %f kg CO2\n", public_transport_footprint);
fprintf("\nTotal Carbon Footprint: %f kg CO2\n", total_footprint);

if total_footprint > 1000
    img = imread('high_footprint.jpg');
    imshow(img);
elseif total_footprint > 500
    img = imread('medium_footprint.jpg');
    imshow(img);
else
    img = imread('low_footprint.jpg');
    imshow(img);
end


fprintf("\nRecommendations:\n");

if car_footprint > (total_footprint * 0.3)
    fprintf("- Consider carpooling, biking, or using public transport more often to reduce car emissions.\n");
    fprintf("- Look into electric or hybrid vehicle options that emit less or no CO2.\n");
    fprintf("- Plan your routes efficiently to minimize unnecessary drives.\n");
end

if plane_footprint > (total_footprint * 0.2)
    fprintf("- Reduce air travel when possible. Opt for trains or buses for shorter distances.\n");
    fprintf("- Consider carbon offsetting your flights by investing in sustainable projects.\n");
end

if electricity_footprint > (total_footprint * 0.25)
    fprintf("- Switch to energy-efficient appliances and LED lighting.\n");
    fprintf("- Consider using green energy providers or installing solar panels.\n");
    fprintf("- Practice energy-saving habits: turn off lights when not needed, unplug devices, use programmable thermostats.\n");
end


fprintf("- Plant trees or support reforestation projects. Trees absorb CO2 and provide oxygen.\n");
fprintf("- Educate and encourage friends and family to be conscious of their carbon footprint.\n");
fprintf("- Support policies and initiatives that promote sustainability and reduce carbon emissions.\n");
fprintf("- Recycle and reduce waste. Consider composting organic waste.\n");
fprintf("- Reduce water waste; it takes energy to pump and heat water.\n");

categories = {'Car', 'Plane', 'Home Energy', 'Meals', 'Public Transport'};
emissions = [car_footprint, plane_footprint, electricity_footprint, food_footprint, public_transport_footprint];
figure;
bar(emissions);
set(gca, 'XTickLabel', categories);
ylabel('kg CO2');
title('Carbon Footprint Breakdown');

