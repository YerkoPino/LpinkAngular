class PrincipalController < ApplicationController

  skip_before_action :verify_authenticity_token
	respond_to :json


    # Retorna todas las actas

  	def index

  		respond_to Actum.all

  	end

      def usuariosProyecto
        @argumentos = params[:proyecto]
        #@usuariosProyecto = ParticipanteProyecto.where(:proyecto_id => @argumentos)
        @usuariosProyecto = Participante.find_by_sql(["SELECT  participantes.id, participantes.participante_iniciales, participantes.participante_foto FROM participantes , participante_proyectos WHERE participantes.id = participante_proyectos.participante_id and participante_proyectos.proyecto_id = ? ", @argumentos])

        respond_to do |format|
          format.json {render json: @usuariosProyecto}
        end
      end

      def cantidadUsuariosProyecto
        @argumentos = params[:proyecto]
        @usuarios = ParticipanteProyecto.where(:proyecto_id => @argumentos).count
        respond_to do |format|
          format.json { render json: { :cantidad => @usuarios}.to_json }
        end

      end


    # Para ver la asistencia

    def usuarios

      @argumento1 = params[:argumento1]
      @usuariosAll = Participante.find_by_sql(["SELECT  participantes.id, participantes.participante_iniciales, participantes.participante_nombre, participantes.participante_apellido, participantes.participante_foto, participante_acta.actum_id, participante_acta.participante_acta_estado, acta.acta_correlativo
        FROM participantes , participante_proyectos, participante_acta, acta
        WHERE participante_acta.actum_id = acta.id and participantes.id = participante_proyectos.participante_id and participantes.id = participante_acta.participante_id and participante_proyectos.proyecto_id = ?", @argumento1])

      respond_to do |format|
        format.json {render json: @usuariosAll}
      end

    end

    def usuariosActa 

      @argumentos = params[:proyecto]
      @actasUsuario = ParticipanteActum.all
       @usuariosAll = Participante.find_by_sql(["SELECT participantes.id, participantes.participante_iniciales, participantes.participante_foto FROM participantes , participante_proyectos WHERE participantes.id = participante_proyectos.participante_id and participante_proyectos.proyecto_id = ? ", @argumento1])

      respond_to do |format|
        format.json {render json: @actasUsuario}
      end
    end


    def createAsistencia

      @asist = ParticipanteActum.new(asistencia)
      @asist.save
        respond_to do |format|
          @argumento2 = @asist.participante_id
          @argumento3 = @asist.actum_id
          @nuevoValor = Participante.find_by_sql(["SELECT  participantes.id, participantes.participante_iniciales, participantes.participante_nombre, participantes.participante_apellido, participantes.participante_foto, participante_acta.actum_id, participante_acta.participante_acta_estado, acta.acta_correlativo
            FROM participantes , participante_acta, acta
            WHERE participante_acta.actum_id = acta.id and participantes.id = participante_acta.participante_id and participantes.id = ? and participante_acta.actum_id = ?", @argumento2, @argumento3])
          format.json {render json: @nuevoValor}
        end  
    end


  def test
  end


  private
   def asistencia
     params.require(:usuario).permit(:participante_id, :actum_id, :participante_acta_estado)
   end

end
