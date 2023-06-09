require_relative 'encriptador'

RSpec.describe 'encriptarMensaje' do
  it 'encripta correctamente el mensaje' do
    mensaje = 'RUBY'
    clave = 'CODEC'
    mensaje_encriptado = encriptarMensaje(mensaje, clave)

    expect(mensaje_encriptado).to eq('TIEC')
  end
end