package com.works.satis_bildirimi.utils;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class LocalDatePropertyEditor extends PropertyEditorSupport {
    @Override
    public void setAsText(String text) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.setValue(LocalDate.parse(text,formatter));
    }

    @Override
    public String getAsText() {
        return this.getValue().toString();
    }

    public LocalDate parse(String text, Locale locale) throws ParseException {
        LocalDate date = LocalDate.parse(text);
        return date;
    }
}
