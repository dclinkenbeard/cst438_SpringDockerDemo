package com.daclink.demopracticetwo;

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Drew "Dr.C" Clinkenbeard
 * <br>
 * created: 2/20/25
 * @since 0.1.0
 */

@RestController
public class GreetingController {

  private static final String template = "Hello %s!";
  private final AtomicLong counter = new AtomicLong();

  @GetMapping("/greeting")
  public Greeting greeting(@RequestParam(value = "name", defaultValue = "There") String name){
    return new Greeting(counter.incrementAndGet(), String.format(template,name));
  }


}
