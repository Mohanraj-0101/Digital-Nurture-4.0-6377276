package org.example;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class Ex4AAATest {

    private Calculator calc;

    @Before
    public void setUp() {

        calc = new Calculator();
        System.out.println(">>> Setup done");
    }

    @After
    public void tearDown() {
        calc = null;
        System.out.println(">>> Teardown done");
    }

    @Test
    public void testAddWithAAA() {
        // Arrange: done in @Before

        // Act
        int result = calc.add(10, 5);

        // Assert
        assertEquals("Sum should be 15", 15, result);
    }
}
