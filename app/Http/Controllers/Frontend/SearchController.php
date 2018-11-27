<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Video;
use App\Models\VideoMeta;
use DB;

class SearchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index( Request $request, VideoMeta $videoMeta ) {
        
        return $this->filter( $request, $videoMeta );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show( Request $request, VideoMeta $videoMeta ) {

        return $this->filter( $request, $videoMeta );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    } 

    private function filter( $request, $videoMeta ) {

        /*
            Search Variable;
        */
        $q = $request->q ?? '';
        $sort = $request->sort ?? 'desc';
        $pagination = env('pagination');

        /*
            Search Query based on if var is not empty ;
        */
        if ($request->has('q') && $q !== '') {

            $videoSearchQuery = DB::table( 'videos' )
                ->join( 'video_metas', 'videos.id', '=', 'video_metas.video_id' )
                ->select( 'videos.id', 'videos.name', 'videos.slug' )
                ->where( 'videos.name', 'like', "%" .$q. "%" )
                ->orWhere( 'video_metas.meta_value', 'like',"%" .$q. "%" )
                ->groupBy( 'videos.id', 'videos.name', 'videos.slug')
                ->orderBy( 'videos.updated_at', $sort )
                ->paginate($pagination);
        }   else {

            $videoSearchQuery = Video::orderBy( 'updated_at', $sort )->paginate($pagination);
            
        }

        $videoArray = array();
        $videoArray['total'] = $videoSearchQuery->count();

        if( $videoSearchQuery->total()> 0 ) {
            foreach( $videoSearchQuery as $searchQuery ) {

                $description = $videoMeta->getVideoMeta($searchQuery->id, 'description' );
                $images      = unserialize( $videoMeta->getVideoMeta($searchQuery->id, 'images' ) );

                $videoArray[]   =  array(
                    'video_id'  =>  $searchQuery->id,
                    'name'      =>  $searchQuery->name,
                    'slug'      =>  $searchQuery->slug, 
                    'description'   =>  $description,
                    'images'    =>  $images,
                );
            }
        }

        return view('frontend.search', ['q' => $q, 'videos' => $videoArray, 'paginate' => $videoSearchQuery ]);
    }
}
