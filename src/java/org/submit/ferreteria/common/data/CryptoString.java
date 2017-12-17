package org.submit.ferreteria.common.data;
/* 
 * Description of CryptoString: Encripta y Desencripta una cadena
 */

import javax.crypto.*;
import javax.crypto.spec.DESedeKeySpec;
import java.security.spec.KeySpec;

public class CryptoString {

    private SecretKey getKeyString() throws Exception {
        /* PASO 1: Crear e inicializar clave */
        String keyString = "ACED00057372001E636F6D2E73756E2E63727970746F2E70726F76696465722E4445534B65796B349C35DA1568980200015B00036B65797400025B427870757200025B42ACF317F8060854E00200007870000000086438D0196107EFF1";
        byte[] keyBytes = keyString.getBytes("UTF8");
        KeySpec keySpec = new DESedeKeySpec(keyBytes);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
        SecretKey clave = keyFactory.generateSecret(keySpec);
        return clave;
    }

    public String encrypt(String texto) throws Exception {
        /* PASO 2: Crear cifrador */
        Cipher cifrador = Cipher.getInstance("DESede/ECB/PKCS5Padding");

        /* PASO 3a: Inicializar cifrador en modo CIFRADO */
        cifrador.init(Cipher.ENCRYPT_MODE, getKeyString());
        byte[] textoCifrado = cifrador.update(texto.getBytes());  // Pasa texto claro leido al cifrador
        textoCifrado = cifrador.doFinal(); // Completar cifrado
        return new String(textoCifrado);
    }

    public String decrypt(String texto) throws Exception {
        /* PASO 2: Crear cifrador */
        Cipher cifrador = Cipher.getInstance("DESede/ECB/PKCS5Padding");

        /* PASO 3b: Poner cifrador en modo DESCIFRADO */
        cifrador.init(Cipher.DECRYPT_MODE, getKeyString());
        byte[] textoDescifrado = cifrador.update(texto.getBytes()); // Pasar texto al descifrador
        textoDescifrado = cifrador.doFinal(); // Completar descifrado
        return new String(textoDescifrado);
    }

    public static void main(String[] args) {
        CryptoString cryp = new CryptoString();
        try {
            System.out.println("" + cryp.encrypt("123"));
            //áIÿ˜¾÷
            System.out.println("" + cryp.decrypt("áIÿ˜¾÷"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
