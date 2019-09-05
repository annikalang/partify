import "bootstrap";
import "animate.css";
import { highlighter } from '../plugins/navbar_highlighter';
  // $( function() {
  //   $( "#slider-range" ).slider({
  //     range: true,
  //     min: 0,
  //     max: 100,
  //     values: [<%=@tracks.minimum(:energy)*100%>, <%=@tracks.maximum(:energy)*100%>],
  //     slide: function( event, energy ) {
  //       $("#energy_min").val(energy.values[ 0 ]+ "%")+ "-" + $("#energy_max").val(energy.values[ 1 ]+ "%" )
  //       //$("#energy1").val(energy.values[ 1 ]+ "%" );
  //     }
  //   });
  //   $( "#slider_range" ).val($( "#slider-range" ).slider( "values", 0 ) + "%" +
  //     " - " + $( "#slider-range" ).slider( "values", 1 ) + "%");
  // } );

highlighter();
