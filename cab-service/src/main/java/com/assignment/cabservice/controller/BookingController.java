package com.assignment.cabservice.controller;

import com.assignment.cabservice.dao.BookingDetailDao;
import com.assignment.cabservice.model.Booking;
import com.assignment.cabservice.model.Car;
import com.assignment.cabservice.repository.BookingRepository;
import com.assignment.cabservice.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Optional;

@Controller
@SessionAttributes({"username","id"})
public class BookingController {
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private CarRepository carRepository;
    


    
    @GetMapping("book-car")
    //@ResponseBody
    public String bookCar(@RequestParam int carId, @RequestParam String username, ModelMap modelMap) {
        Car car=carRepository.findById(carId).get();
        car.setAvailableForBooking(false);
        Booking newBooking=new Booking();
        newBooking.setCarId(carId);
        newBooking.setDriverId(car.getDriverId());
        newBooking.setStatus("booked");
        newBooking.setUsername(username);
        carRepository.save(car);
        bookingRepository.save(newBooking);
        String cancelCarUrl="localhost:8084/cancel-car?bookingId="+newBooking.getId();
        BookingDetailDao bookingDetailDao=new BookingDetailDao(newBooking,cancelCarUrl);
        modelMap.addAttribute("bookingId", newBooking.getId());
        return "bookcar";
    }
    
    //@ResponseBody
    @GetMapping("cancel-car")
    public String cancelCar(@RequestParam int bookingId,ModelMap modelMap) {
        Optional<Booking> bookingOptional=bookingRepository.findById(bookingId);
 
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String loggedInUsername = authentication.getName();
        
        
        if(bookingOptional.isEmpty() || !bookingOptional.get().getUsername().equals((loggedInUsername))) {
            return "You Entred Wrong Details";
        }

        Booking booking=bookingOptional.get();
        Car car=carRepository.findById(booking.getCarId()).get();
        car.setAvailableForBooking(true);
        carRepository.save(car);
        bookingRepository.deleteById(bookingId);
        return "booking";
    }
}