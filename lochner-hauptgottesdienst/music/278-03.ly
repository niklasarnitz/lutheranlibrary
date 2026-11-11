\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 278, printed p. 253.
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
      \new Voice = "melody" { g'1 bes'1 a'1 g'1 bes'1 bes'1 bes'\breve \bar "|" a'1 bes'1 g'1 f'1 g'1 bes'1 a'1( g'1 a'1) g'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t der für euch ge -- ge -- ben "wird." Das thut zu mei -- nem Ge -- dächt -- \skip 1 \skip 1 "niß." }
    \new PianoStaff <<
      \new Staff { \clef treble \global <ees' g'>1 <f' bes'>1 r1 r1 <g' bes'>1 r1 <g' a' bes'>\breve \bar "|" <f' a'>1 <f' bes'>1 <ees' g'>1 <d' f'>1 r1 <d' bes'>1 <fis' a'>1( <bes g'>1 <f' a'>1) <d' g'>\breve }
      \new Staff { \clef bass \global <c c'>1 <bes, d'>1 r1 r1 <g d'>1 r1 <g d'>\breve \bar "|" <f c'>1 <bes, d'>1 <ees bes>1 <bes, bes>1 r1 <g bes>1 << { \voiceOne d'1.( d'2 c'1) } \\ { \voiceTwo d\breve s1 } >> <g a bes>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
