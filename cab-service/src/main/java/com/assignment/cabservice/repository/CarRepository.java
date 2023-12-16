package com.assignment.cabservice.repository;

import com.assignment.cabservice.model.Car;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

@Transactional
public interface CarRepository extends JpaRepository<Car,Integer> {
    List<Car> findBySeatingCapacityAndAvailableForBookingTrue(int seatingCapacity);

    List<Car> findByIdIn(List<Integer> carIds);
}
