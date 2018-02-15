if (instance_place(x, y, par_entity)) { 
    with (instance_place(x, y, par_entity)) {
        // Move
        if (abs(vx) <= 1 && abs(vy) <= 1) {
            // Nothing
        } else if (abs(vx) <= 1)
            other.xskew = round(random_range(2, 4)) * choose(-1, 1);
        else
            other.xskew = round(random_range(2, 4)) * sign(vx);
            
        // Target
        if (abs(vx) > 1 || abs(vy) > 1)
            other.xset  = other.xskew;
    }
}

