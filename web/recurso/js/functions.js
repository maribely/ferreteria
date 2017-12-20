/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function listar() {
            document.bus_fm.action = 'list.jsp';
            document.bus_fm.submit();
        }
        function focus_on_filter() {
            document.bus_fm.filter.select();
        }
        function editar() {
            if (document.resultado_form.id.value === '') {
                alert('Escoja una opción por favor');
                return false;
            }
            return true;
        }
        function nuevo() {
            document.resultado_form.go.value = 'Crear';
            document.resultado_form.submit();
        }
        function enter() {
            if (window.event)
                keycd = window.event.keyCode;
            else if (evnt && evnt.which)
                keycd = evnt.which;
            else
                return;
            if (keycd === 13)
                document.resultado_form.submit();
        }
        if (document.captureEvents) {
            document.captureEvents(Event.KEYPRESS);
            document.onkeypress = enter;
        }


