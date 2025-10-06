"""Step Estimator Program"""

class StepEstimator {
    def init(self: StepEstimator, gender: str, distance_km: float, speed: float) {
        self.gender = gender;
        self.distance_km = distance_km;
        self.speed = speed;
        self.stride_length = 0.0;
        self.steps = 0;
    }

    def estimate(self: StepEstimator) {
        # Set stride length based on gender
        if self.gender == "male" {
            self.stride_length = 0.78;
        } elif self.gender == "female" {
            self.stride_length = 0.70;
        } else {
            print("⚠️ Invalid gender entered, using default stride length (0.74 m).");
            self.stride_length = 0.74;
        }

        # Convert distance to meters
        distance_m = self.distance_km * 1000.0;

        # Calculate steps
        self.steps = int(distance_m / self.stride_length);

        # Print results
        print("📊 Results:");
        print("Gender: " + self.gender);
        print("Distance: " + str(self.distance_km) + " km");
        print("Speed: " + str(self.speed) + " km/h");
        print("Estimated stride length: " + str(self.stride_length) + " m");
        print("Approximate steps taken: " + str(self.steps));
    }
}

with entry {
    gender = input("Enter gender (male/female): ");
    distance = float(input("Enter distance in km: "));
    speed = float(input("Enter speed in km/h: "));
    estimator = StepEstimator(gender, distance, speed);
    estimator.estimate();
}