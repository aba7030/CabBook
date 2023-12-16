package com.assignment.cabservice.controller;

import com.assignment.cabservice.dao.DriverUseCarsDao;
import com.assignment.cabservice.model.Car;
import com.assignment.cabservice.model.CarRequest;
import com.assignment.cabservice.model.Driver;
import com.assignment.cabservice.repository.CarRepository;
import com.assignment.cabservice.repository.CarRequestRepository;
import com.assignment.cabservice.repository.DriverRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DriverController {
    @Autowired
    private DriverRepository driverRepository;
    @Autowired
    private CarRepository carRepository;
    @Autowired
    private CarRequestRepository carRequestRepository;

    @GetMapping("list-drivers")
    public String listAllDrivers(ModelMap modelMap) {
        List<Driver> drivers=driverRepository.findAll();
        modelMap.put("drivers",drivers);
        return "listDrivers";
    }

    @GetMapping("driver/used-cars")
    public String getCarsUsedByDriver(@RequestParam int driverId) throws Exception {
        Optional<Driver> driverOptional=driverRepository.findById(driverId);
        if(driverOptional.isPresent()) {
            Driver driver=driverOptional.get();
            String[] usedCars=driver.getUsedCarIds().split(",");
            List<Integer> carIds=new ArrayList<>();
            for(String cardId:usedCars) {
                carIds.add(Integer.parseInt(cardId));
            }

            List<Car> carList=carRepository.findByIdIn(carIds);
            DriverUseCarsDao driverUseCarsDao=new DriverUseCarsDao(driverId,driver.getUsername(),carList);
            
            //modelMap.addAttribute("bookingId", newBooking.getId());
            return "use";
        }

        throw new Exception("Driver not found");
    }
    


    @GetMapping("add-driver")
    public String showNewDriverPage(Driver driver) {
        return "driver";
    }

  
    @PostMapping("add-driver")
    public String addNewDriver(Driver driver) {
        driver.setPassword("$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2");//123
        driver.setUsedCarIds(""+driver.getAssignedCarId());
        Driver savedDriver=driverRepository.save(driver);
        Car car=carRepository.findById(driver.getAssignedCarId()).get();
        car.setDriverId(savedDriver.getId());
        carRepository.save(car);
        return "redirect:list-drivers";
    }
    
    @GetMapping("delete-driver")
    public String deleteDriver(@RequestParam int id) {
        driverRepository.deleteById(id);
        return "redirect:list-drivers";
    }
    

    @GetMapping(value="request-car")
    public String requestNewCar(@RequestParam int driverId,@RequestParam int carId) {
        CarRequest newCarRequest=new CarRequest();
        newCarRequest.setDriverId(driverId);
        newCarRequest.setCarId(carId);
        newCarRequest.setRequestStatus("PENDING");
        carRequestRepository.save(newCarRequest);
        return "redirect:list-car-requests";
    }

}
