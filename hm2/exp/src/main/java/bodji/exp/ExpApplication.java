package bodji.exp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ExpApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExpApplication.class, args);
        System.out.println("Додаток успішно запущено. Вітаємо!");
    }

}
