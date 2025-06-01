function [ xx yy] = circle1(m,n,r,s)

    segm=linspace(-pi,pi,s);

    xx = r*cos(segm)+m;
    yy = r.*sin(segm)+n;

end