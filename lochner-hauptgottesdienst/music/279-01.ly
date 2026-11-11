\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 279, printed p. 254.
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
      \new Voice = "melody" { a'1( g'1) g'1( a'1) a'\breve \bar "|" a'1 f'1 g'1 g'1 bes'\breve a'1( g'1 a'1) g'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t und \skip 1 dan -- \skip 1 "ket," und gab ih -- nen den und \skip 1 \skip 1 "sprach:" }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 <e'! g'>1 r1 <f' g' a'>\breve \bar "|" r1 r1 r1 r1 <d' bes'>\breve <fis' a'>1( <bes g'>1 <f' a'>1) <g' g'>\breve }
      \new Staff { \clef bass \global r1 r1 <c c'>1 r1 <f c'>\breve \bar "|" r1 r1 r1 r1 <g bes>\breve << { \voiceOne d'1.( d'2 c'1) } \\ { \voiceTwo d\breve s1 } >> <g bes>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
