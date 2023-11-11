const Functions = require("chainlink-test-helpers");

const getVehicleId = Functions.makeHttpRequest({
  url: `https://api.nhtsa.gov/SafetyRatings/modelyear/${modelyear}/make/${brand}/model/${model}`,
  // Get a free API key from https://coinmarketcap.com/api/
  headers: {
    "Content-Type": "application/json",
  },
});

const vehicleId = Promise.all([getVehicleId]).Results[0].VehicleId;
console.log(vehicleId);
