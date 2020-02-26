mixin DistanceRatioMixin{

    double getDefaultDistanceRatio(double distanceRatio,int time) {

        if (time >= 0 && time <= 15) {
            return (15 - time) * 0.012 + distanceRatio;
        } else if (time > 15 && time <= 30) {
            return distanceRatio;
        } else if (time > 30 && time <= 45) {
            return (time - 30) * 0.012 + distanceRatio;
        } else if (time > 45 && time <= 60) {
            return distanceRatio + 0.2;
        } else {
            return distanceRatio;
        }
    }

    double getHourDistanceRatio(double distanceRatio,double time) {
        const double constantRatio = 1.41;

        if (time >= 0 && time <= 3) {
            return (3 - time) * 0.012 + constantRatio;
        } else if (time > 3 && time <= 6) {
            return constantRatio;
        } else if (time > 6 && time <= 9) {
            return (time - 6) * 0.012 + constantRatio;
        } else if (time > 9 && time <= 12) {
            return constantRatio + 0.1;
        } else {
            return constantRatio;
        }
    }
}