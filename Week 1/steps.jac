"""Step Estimator Program"""

walker StepEstimator {
    has gender: str;
    has distance_km: float;
    has speed: float;
    has stride_length: float = 0.0;
    has steps: int = 0;

    can start with root entry;
}

impl StepEstimator.start {
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

with entry:__main__ {
    root spawn StepEstimator("male", 2.5, 5.0);
    root spawn StepEstimator("female", 1.8, 4.2);
}
