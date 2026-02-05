times = ('Cruzeiro', 'Palmeiras', 'Grêmio', 'Redbull Bragantino', 'Flamengo', 'Ceará', 'Fluminense',
         'Fortaleza', 'Atlético-MG', 'Corínthians', 'Sport', 'Botafogo', 'Santos',
         'Internacional', 'São Paulo', 'Bahia', 'Mirassol',
         'Vasco da Gama', 'Juventude', 'Vitória')
print('-=' *65)
print(f'Lista de times do Brasileirão Assaí Série A: {times}')
print('-=' *65)
print(f'Os que se classificam para a Libertadores são {times[0:6]}')
print('-=' *65)
print(f'Os que se classificam para Sudamericana são {times[7:13]}')
print('-=' *65)
print(f'Os rebaixados são {times[16:20]}')
print('-=' *65)
print(f"O Cruzeiro está na {times.index('Cruzeiro')+1}ª posição")