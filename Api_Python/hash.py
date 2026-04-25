def generar_hash(valor: str) -> str:
    """
    Hasheo manual: convierte cada caracter en su código ASCII,
    aplica operaciones aritméticas y devuelve un string hexadecimal.
    """
    resultado = 0
    primo = 31  # número primo para dispersión

    for caracter in valor:
        resultado = (resultado * primo + ord(caracter)) % (2**64)  # limitar tamaño

    # Convertir a hexadecimal para que se vea como un hash
    return hex(resultado)[2:]


