% Set up python to call SPKM

SPKMpath = fileparts(which('spkm.py'));
if count(py.sys.path, SPKMpath)==0
    insert(py.sys.path,int32(0),SPKMpath);
end

poolobj = gcp('nocreate');
if ~isempty(poolobj)
    poolsize = poolobj.NumWorkers;
    parfor i=1:poolsize
       if count(py.sys.path, SPKMpath)==0
            insert(py.sys.path,int32(0),SPKMpath);
       end
    end
end
