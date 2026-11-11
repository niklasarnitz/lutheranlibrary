\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 276, printed p. 251.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { g'1 f'1 g'1 a'1 g'1 f'1( g'1) s2 bes'1 s2 a'1( g'1 a'1) g'1 g'\breve \bar "|" d'1 f'1 f'1( g'1) g'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t als wir ver -- ge -- ben un -- \skip 1 sern Schul -- \skip 1 \skip 1 di -- "gern." Und führ uns \skip 1 nicht }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 r1 r1 <d' f'>1( <ees' g'>1) f'2 <d' bes'>1 g'2 <d' fis' a'>1( <bes g'>1 <d' fis'! a'>1) r1 <d' g'>\breve \bar "|" d'1 <d' f'>1 r1 r1 <d' g'>\breve }
      \new Staff { \clef bass \global r1 r1 r1 r1 r1 <d a>1( <c c'>1) s2 <bes, d'>1 s2 d\breve~ d1 r1 <g a bes>\breve \bar "|" <g bes>1 <d a>1 r1 r1 <g a bes>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
