package com.works.satis_bildirimi.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Locale;

@Configuration
@Service
public class LocalDateConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addFormatters(FormatterRegistry registry) {
        super.addFormatters(registry);
        registry.addFormatterForFieldType(LocalDate.class, new Formatter<LocalDate>() {
            @Override
            public String print(LocalDate object, Locale locale) {
                return null;
            }

            @Override
            public LocalDate parse(String text, Locale locale) throws ParseException {
                LocalDate date = LocalDate.parse(text);
                return date;
            }
        });
    }
}