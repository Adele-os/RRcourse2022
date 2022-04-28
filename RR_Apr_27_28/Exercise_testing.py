def Fahrenheit_Converter(f: float,target: str) -> float:
    '''
    This is the function for the conversion of the temperature from Fahrenheit degree 
    into the target scale such as Celsius or Kelvins

        Parameters:
            f (float): A degree in Fahrenheit
            target (str): Either 'Celsius' or 'Kelvins'

        Returns:
                c (float): A degree in expected scales
    '''
	# Raise and error if the target is not defined
    if target not in ['Celsius','Kelvins','C','K']:
        raise ValueError("The target scale is not defined. Please use one of these:\n 'Celsius','Kelvins','C' or 'K'")
    try:
    # Checking for the correct type of the Fahrenheit degree if it's a float
        f = float(f)

        # Check if the Fahrenheit degree is bigger of equal -459.67 for the purpose of validity
        if f >= -459.67: 
            cel = (f - 32.0) * (5.0/9.0)
            if target in ['Celsius','C']:
                # Roudnig for the better output and expectations from unittest
                return round(cel,2)

            elif target in ['Kelvins','K']:
                return round(273.15 + cel,2)
        # This will check the accepted range of the Fahrenheit value
        else:
            raise Exception("The value is samller than the minimum value of -459.67 F")        
    except ValueError:
            print("The provided degree value is not a number")        

# Testing the required tests from the exercise using unittest module 
import unittest

class Fahrenheit_test(unittest.TestCase):

    # Testing whether Réaumur will result in error as a wrong target    
    def test_Target(self):
        with self.assertRaises(ValueError):
            Fahrenheit_Converter(50, 'Réaumur')

    # Testing for the correct Celsius outputs for three values
    def test_Cel(self):
        self.assertEqual(Fahrenheit_Converter(90, 'Celsius'), 32.22)
        self.assertEqual(Fahrenheit_Converter(70, 'C'), 21.11)
        self.assertEqual(Fahrenheit_Converter(50, 'C'), 10)

    # Testing if the user enters a value below -459.67    
    def test_Below(self):
        with self.assertRaises(Exception):
            Fahrenheit_Converter(-500,'K')

    # Testing for the correct Kelvins outputs        
    def test_Kel(self):
     	self.assertEqual(Fahrenheit_Converter(0,'K'),255.37)
     	self.assertEqual(Fahrenheit_Converter(1000,'Kelvins'),810.93)


if __name__ == '__main__':
    unittest.main()
