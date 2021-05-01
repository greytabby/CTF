import java.util.*;

class VaultDoor1 {
    public static void main(String args[]) {
        VaultDoor1 vaultDoor = new VaultDoor1();
				System.out.println("picoCTF{" + "d35cr4mbl3_tH3_cH4r4cT3r5_ff63b0" + "}");
    }

    // I came up with a more secure way to check the password without putting
    // the password itself in the source code. I think this is going to be
    // UNHACKABLE!! I hope Dr. Evil agrees...
    //
    // -Minion #8728
    public boolean checkPassword(String password) {
        return password.length() == 32 &&
               password.charAt(0)  == 'd' &&
               password.charAt(1)  == '3' &&
               password.charAt(2)  == '5' &&
               password.charAt(3)  == 'c' &&
               password.charAt(4)  == 'r' &&
               password.charAt(5)  == '4' &&
               password.charAt(6)  == 'm' &&
               password.charAt(7)  == 'b' &&
               password.charAt(8)  == 'l' &&
               password.charAt(9)  == '3' &&
               password.charAt(10) == '_' &&
               password.charAt(11) == 't' &&
               password.charAt(12) == 'H' &&
               password.charAt(13) == '3' &&
               password.charAt(14) == '_' &&
               password.charAt(15) == 'c' &&
               password.charAt(16) == 'H' &&
               password.charAt(17) == '4' &&
               password.charAt(18) == 'r' &&
               password.charAt(19) == '4' &&
               password.charAt(20) == 'c' &&
               password.charAt(21) == 'T' &&
               password.charAt(22) == '3' &&
               password.charAt(23) == 'r' &&
               password.charAt(24) == '5' &&
               password.charAt(25) == '_' &&
               password.charAt(26) == 'f' &&
               password.charAt(27) == 'f' &&
               password.charAt(28) == '6' &&
               password.charAt(29) == '3' &&
               password.charAt(30) == 'b' &&
               password.charAt(31) == '0';
    }
}
