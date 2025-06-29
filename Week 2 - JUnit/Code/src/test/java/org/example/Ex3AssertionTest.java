package org.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class Ex3AssertionTest {
    @Test
    public void testAssertions() {
        Calculator calc = new Calculator();
        int sum = calc.add(2, 3);

        assertEquals(5, sum);
        assertTrue(sum > 0);
        assertFalse(sum < 0);
        assertNotNull(sum);
    }
}


