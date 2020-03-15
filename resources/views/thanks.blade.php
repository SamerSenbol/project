
@extends('layouts.index')



@section('center')

<form method="post" action="https://sandbox.paypal.com/cgi-bin/webscr">

<section id="do_action">
    <div class="container">
        <div class="heading">
            @if (session('status'))
                                        <div class="alert alert-success">
                                            {{ session('status') }}
                                        </div>
                                    @endif
        </div>
       
    </div>
</section><!--/#do_action-->
</form>


@endsection


