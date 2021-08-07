package com.avengors.controller.api;

import com.avengors.entity.air.AirResponse;
import com.avengors.service.air.AirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/api/air")
public class AirApiController {

    @Autowired
    private AirService airService;

    @GetMapping("/{informCode}")
    public ResponseEntity<AirResponse> dust(@PathVariable String informCode) throws IOException {
        if (!informCode.equals("pm10") && !informCode.equals("pm25")) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(airService.fineDust(informCode.toUpperCase()));
    }
}
