package org.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class Ex1BasicTest {
    @Test
    public void testBasicAddition() {
        Calculator calc = new Calculator();
        int result = calc.add(1, 2);
        assertEquals(3, result);
    }
}
